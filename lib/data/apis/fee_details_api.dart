import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:braucoe/data/models/fee_details.dart';

class FeeDetailsAPI
{
  late FeeDetails feeDetails;
  Future<FeeDetails> getFeeDetails(int? studentId) async
  {
    final uri = Uri.parse('http://braucoeapi-production.up.railway.app/fee-details/$studentId');
    final response = await http.get(uri);
    final body = jsonDecode(response.body);
    print(body);
    feeDetails = FeeDetails.fromJson(body);
    print(feeDetails.year1FeePaid);
    return feeDetails;
  }
}
