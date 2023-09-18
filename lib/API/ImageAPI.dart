import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ImageAPI
{
    Future uploadAPI(value) async
    {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://braucoeapi-production.up.railway.app/updateProfileDp/2081951044'), // Replace with your API endpoint
      );
      print("File Dtetcted");
      print(value.path);
      print("uploading");
      request.files.add(
        await http.MultipartFile.fromPath('image', value.path),
      );

      var response = await request.send();
      print("Request Sent and Uploaded ${response.statusCode}");
    }
}