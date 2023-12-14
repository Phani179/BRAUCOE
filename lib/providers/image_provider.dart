import 'package:http/http.dart' as http;
import 'package:braucoe/providers/login_provider.dart';

class ImageAPI
{
    Future uploadAPI(value) async
    {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://braucoeapi-production.up.railway.app/updateProfileDp/${LoginAPI.studentDetails?.studentId}'), // Replace with your API endpoint
        // http://braucoeapi-production.up.railway.app
      );
      print("File Detected");
      print(value.path);
      print("uploading");
      request.files.add(
        await http.MultipartFile.fromPath('image', value.path),
      );
      print('Uploading on the way.');
      var response = await request.send();
      print('Success');
      // print("Request Sent and Uploaded ${response.statusCode}");
      return response;
    }
}

// import 'package:dio/dio.dart';
//
// class ImageAPI {
//   Future uploadAPI(value) async {
//     Dio dio = Dio(); // Create a Dio instance
//     FormData formData = FormData.fromMap({
//       // Create a FormData object
//       'image': await MultipartFile.fromFile(value.path), // Add the image file
//     });
//     print("File Detected");
//     print(value.path);
//     print("uploading");
//     try {
//       // Try to send the POST request
//       var response = await dio.post(
//         // Use the post method
//         'http://localhost:8080/updateProfileDp/${LoginAPI.studentDetails?.studentId}', // Replace with your API endpoint
//         data: formData, // Pass the FormData object as data
//       );
//       print("Request Sent and Uploaded ${response.statusCode}");
//     } catch (e) {
//       // Catch any errors
//       print("Error: $e");
//     }
//   }
// }

