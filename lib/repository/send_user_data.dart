import 'package:dio/dio.dart';
import '../repository/dio_client.dart';

class SendUserData {
  static SendUserData instance = SendUserData._();
  final DioClient _dioClient = DioClient();

  SendUserData._();

  Future<Map<String, dynamic>> sendUserData(String username, String email,
      String phone) async {
    var userData = <String, String>{
      'username': username,
      'email': email,
      'phone': phone,
    };
    var response = await _dioClient.dio.post('/api/submit', data: userData);

    return {
      'data': response.data,
      'statusCode': response.statusCode,
    };
  }
}