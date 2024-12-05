// services/request_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/solicit.dart';

class RequestService {
  final String baseUrl = "http://leonelh2024-001-site1.ntempurl.com";

  Future<List<Request>> fetchRequests() async {
    final response =
        await http.get(Uri.parse('$baseUrl/Solicitud/GetAllSolit'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Request.fromJson(json)).toList();
    } else {
      throw Exception("Error al procesar la solicitud");
    }
  }
}
