// services/loan_service.dart
import 'dart:convert';
import 'package:coopfacil/models/prest.dart';
import 'package:http/http.dart' as http;

class LoanService {
  final String baseUrl = "http://leonelh2024-001-site1.ntempurl.com";

  Future<List<Loan>> fetchLoans() async {
    final response = await http.get(Uri.parse('$baseUrl/Prestamo/GetAllDue'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Loan.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load loans");
    }
  }
}
