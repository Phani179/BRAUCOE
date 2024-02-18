import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import 'package:braucoe/utilities/images.dart';
import 'package:braucoe/utilities/encrypt_data.dart';
import 'package:braucoe/screens/class_details/chat_room.dart';
import 'package:braucoe/screens/login/handler.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late Location location;
  List<Map<String, dynamic>> userLocations = [];
  late Future futureData;

  @override
  void initState() {
    super.initState();
    location = Location();
    futureData = _getStudentLocations();
  }

  Future _getStudentLocations() async {
    userLocations = [];
    List<QueryDocumentSnapshot> queryDocumentSnapshot =
        (await firebaseFirestore.collection('student_locations').get()).docs;
    queryDocumentSnapshot.map((e) {
      userLocations.add({
        'registrationId': EncryptData.decryptAES(e['registrationId']),
        'location': _getLatLng(e['location']),
      });
    }).toList();
    return userLocations;
  }

  LatLng _getLatLng(String location) {
    List<String> separated = location.split(',');
    double latitude = double.parse(separated.first.split(':').last);
    double longitude =
        double.parse(separated.last.split(':').last.split(')').first);
    return LatLng(latitude, longitude);
  }

  String _getRollNo(String regNo) {
    return regNo.substring(regNo.length - 2, regNo.length);
  }

  Future<bool> _enableLocationServices() async {
    bool _serviceEnabled;
    PermissionStatus permissionStatus;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }
    permissionStatus = await location.hasPermission();
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus == PermissionStatus.denied) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: _enableLocationServices(),
        builder: (context, _isEnabled) {
          location.changeSettings(
            interval: 50000,
          );
          if (_isEnabled.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Text('Please enable location services.'),
            );
          }
          if (!_isEnabled.data!) {
            return const Center(
              child: Text('Please enable location services.'),
            );
          }
          return StreamBuilder<LocationData>(
              stream: location.onLocationChanged,
              builder: (context, snapshot) {
                return Stack(
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        initialCenter: kCurrentLocation!,
                        initialZoom: 17,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        ),
                        FutureBuilder(
                          future: _getStudentLocations(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return MarkerLayer(
                                markers: [
                                  for (Map user in userLocations)
                                    Marker(
                                      point: user['location'] as LatLng,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            Images.marker,
                                          ),
                                          Positioned(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 12.0),
                                              child: Text(
                                                _getRollNo(
                                                  user['registrationId'],
                                                ),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ],
                    ),
                  ],
                );
              });
        });
  }
}
