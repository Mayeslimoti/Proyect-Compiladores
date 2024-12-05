// pages/requests_page.dart
import 'package:flutter/material.dart';
import '../service/solicit_service.dart';
import '../models/solicit.dart';

class RequestsPage extends StatefulWidget {
  @override
  _RequestsPageState createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  late Future<List<Request>> _requests;

  @override
  void initState() {
    super.initState();
    _requests = RequestService().fetchRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitudes'),
      ),
      body: FutureBuilder<List<Request>>(
        future: _requests,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay solicitudes disponibles.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Request request = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Propósito: ${request.proposito}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Monto: \$${request.monto.toStringAsFixed(2)}'),
                        Text('Tasa de Interés: ${request.tasaInteres}%'),
                        Text('Plazo: ${request.plazo} meses'),
                        Text(
                            'Fecha de Creación: ${request.fechaCreacion.toLocal()}'),
                      ],
                    ),
                    trailing: Icon(
                      request.estado ? Icons.check_circle : Icons.cancel,
                      color: request.estado ? Colors.green : Colors.red,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
