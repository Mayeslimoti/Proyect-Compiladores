// pages/menu_page.dart
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menú Principal'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blue.shade300],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Logo de la aplicación
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: CircleAvatar(
                radius: 60,
                backgroundImage:
                    AssetImage('assets/logo.png'), // Ruta de la imagen del logo
              ),
            ),
            Text(
              'Bienvenido a CoopFácil',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            // Opciones del menú
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: EdgeInsets.all(16),
                children: [
                  _buildMenuCard(
                    context,
                    icon: Icons.account_circle,
                    label: 'Perfil',
                    route: '/profile',
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.account_balance_wallet,
                    label: 'Cuentas',
                    route: '/accounts',
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.attach_money,
                    label: 'Préstamos',
                    route: '/loans',
                  ),
                  _buildMenuCard(
                    context,
                    icon: Icons.request_page,
                    label: 'Solicitudes',
                    route: '/requests',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.white.withOpacity(0.9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.blue.shade700,
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
