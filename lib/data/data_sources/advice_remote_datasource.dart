
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../exeptions/exeption.dart';
import '../models/advice_model.dart';
abstract class AdviceRemoteDataSource{
 Future<AdviceModel> getRandomAdvice();
}
class AdviceRemoteDatSourceImpl implements AdviceRemoteDataSource{
  var client = http.Client();
  @override
  Future<AdviceModel> getRandomAdvice()async {
    final response = await client.get(
      Uri.parse('https://api.flutter-community.com/api/v1/advice'),
      headers: {
        'Content-Type':'application/json'
      }
    );
    if(response.statusCode != 200){
      throw ServerException();
    }
    var decodedJson = jsonDecode(response.body);
    return AdviceModel.fromJson(decodedJson);
  }

}