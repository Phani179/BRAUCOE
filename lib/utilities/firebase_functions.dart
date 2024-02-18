
import 'package:braucoe/utilities/encrypt_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class FirebaseFunctions
{
  static Future<LocationData> getCurrentLocation() async
  {
    Location location = Location();
    return await location.getLocation();
  }

  static void saveToFirestore({required int registrationId, required LatLng location})
  {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    CollectionReference collectionReference = firebaseFirestore.collection('student_locations');
    DocumentReference documentReference = collectionReference.doc(EncryptData.encryptAES(registrationId.toString()));
    documentReference.set({
    'registrationId' : EncryptData.encryptAES(registrationId.toString()),
      'location' : location.toString(),
    });
  }
}


