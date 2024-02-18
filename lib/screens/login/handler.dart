
import "package:flutter/material.dart";

import 'package:braucoe/utilities/firebase_functions.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:braucoe/data/apis/login_api.dart';
import 'package:braucoe/widgets/shimmer_effect/home_page_shimmer_loading.dart';
import 'package:braucoe/screens/login/student_login.dart';
import 'logo_screen.dart';

LatLng? kCurrentLocation;

class Handler extends StatefulWidget {
  static const String routeName = '/handler';
  static bool? loginStatus;

  @override
  State<StatefulWidget> createState() => _Handler();
}

class _Handler extends State<Handler> {
  late SharedPreferences prefs;
  bool? isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    print('Handler');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // body: HomePage()
      body: FutureBuilder(
          future: whereToGo(),
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting)
              {
                return const HomePageShimmerLoading();
              }
            if (snapshot.hasData) {
              if (isLoggedIn != null) {
                if (isLoggedIn == true) {
                  var studentId = prefs.getInt(StudentLogin.studentId);
                  LoginAPI loginAPI = LoginAPI();
                  return FutureBuilder(
                    future: loginAPI.getStudent(studentId),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        print(kCurrentLocation!.toString());
                        List<String> separated = kCurrentLocation!.toString().split(',');
                        print(separated.first.split(':').last);
                        print(separated.last.split(':').last.split(')').first);
                        FirebaseFunctions.saveToFirestore(location : kCurrentLocation!, registrationId : LoginAPI.studentDetails!.studentId as int);
                        LogoScreen.isLoggedIn = true;
                        return const LogoScreen();
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        // Home Page Rendering.
                        return const HomePageShimmerLoading();
                      } else {
                        return const HomePageShimmerLoading();
                      }
                    },
                  );
                } else {
                  LogoScreen.isLoggedIn = false;
                  return const LogoScreen();
                }
              } else {
                LogoScreen.isLoggedIn = false;
                return const LogoScreen();
              }
            }
            return const CircularProgressIndicator();
          }),
    );
  }


  Future whereToGo() async {
    _enableLocationServices();
    LocationData locationData = await FirebaseFunctions.getCurrentLocation();
    kCurrentLocation = LatLng( locationData.latitude!, locationData.longitude!);
    prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool(StudentLogin.isLoggedIn);
    Handler.loginStatus = isLoggedIn ?? false;
    return true;
  }
}

Future<bool> _enableLocationServices() async {
  Location location = Location();
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