// pages/loans_page.dart
import 'package:flutter/material.dart';
import '../service/prest_service.dart';
import '../models/prest.dart';

class LoansPage extends StatefulWidget {
  @override
  _LoansPageState createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
  late Future<List<Loan>> _loans;

  @override
  void initState() {
    super.initState();
    _loans = LoanService().fetchLoans();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Préstamos'),
      ),
      body: FutureBuilder<List<Loan>>(
        future: _loans,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay préstamos disponibles.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Loan loan = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text('Monto: \$${loan.monto.toStringAsFixed(2)}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Tasa de Interés: ${loan.tasaInteres}%'),
                        Text('Plazo: ${loan.plazo} meses'),
                        Text('Saldo: \$${loan.saldo.toStringAsFixed(2)}'),
                        Text(
                            'Fecha de Creación: ${loan.fechaCreacion.toLocal()}'),
                      ],
                    ),
                    trailing: Icon(
                      loan.estado ? Icons.check_circle : Icons.cancel,
                      color: loan.estado ? Colors.green : Colors.red,
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
