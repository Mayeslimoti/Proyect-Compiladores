// pages/profile_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/profile.dart';
import '../const/constants.dart';

class ProfilePage extends StatelessWidget {
  Future<Profile> fetchProfile() async {
    final response = await http.get(
      Uri.parse(
          '${Constants.apiBaseUrl}/User/GetProfile'), // Endpoint del perfil
      headers: {
        'Authorization': 'Bearer <TOKEN_AQUÍ>', // Reemplazar con el token real.
      },
    );

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi Perfil')),
      body: FutureBuilder<Profile>(
        future: fetchProfile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final profile = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blueAccent,
                    child: Text(
                      profile.nombre[0],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${profile.nombre} ${profile.apellido}',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('Correo: ${profile.email}',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 10),
                  Text('Teléfono: ${profile.telefono}',
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
