import 'package:http/http.dart' as http;
import 'package:untitled/providers/login_api.dart';

class ImageAPI
{
    Future uploadAPI(value) async
    {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://braucoeapi-production.up.railway.app/updateProfileDp/${LoginAPI.studentDetails?.studentId}'), // Replace with your API endpoint
        // http://braucoeapi-production.up.railway.app
      );
      print("File Detected");
      print(value.path);
      print("uploading");
      request.files.add(
        await http.MultipartFile.fromPath('image', value.path),
      );

      var response = await request.send();
      print("Request Sent and Uploaded ${response.statusCode}");
    }
}