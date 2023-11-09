
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageServices
{
  FirebaseStorageServices({required this.firebaseStoragePath});
  String firebaseStoragePath;
  get _getSyllabusRef {
    print(firebaseStoragePath);
    return FirebaseStorage.instance
          .ref(firebaseStoragePath);
  }
  get getFirebaseSyllabusRef => _getSyllabusRef;
}