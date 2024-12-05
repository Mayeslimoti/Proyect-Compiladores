import 'package:flutter/material.dart';
import '../menu/menu_page.dart';
import '../pages/login_page.dart';
import '../pages/customer_page.dart';
import '../pages/prest_page.dart';
import '../pages/profile_page.dart';
import '../pages/accounts_page.dart';
import '../pages/solicit_page.dart';

//import '../pages/dashboard_page.dart'; // Otra pantalla que implementaremos

Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => LoginPage(),
  '/menu': (context) => MenuPage(), //Pantalla menu principal
  '/customer': (context) => CustomerPage(), //clientes
  '/profile': (context) => ProfilePage(), //perfiles
  '/accounts': (context) => AccountsPage(), //cuentas
  '/loans': (context) => LoansPage(), //`prestamo
  '/requests': (context) => RequestsPage(), // solicitud
};
