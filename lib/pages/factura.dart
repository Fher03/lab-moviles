import 'package:flutter/material.dart';

void main() {
  runApp(FacturaApp());
}

class FacturaApp extends StatelessWidget {
  const FacturaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factura App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FacturaScreen(),
    );
  }
}

class FacturaScreen extends StatelessWidget {
  const FacturaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formato de Factura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Factura de Gasolinera/Trailero',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Formato de la factura
            Text('Cliente: Juan Pérez'),
            Text('RFC: JUAP800101XXX'),
            Text('Monto: \$500.00'),
            Text('Fecha: 10/10/2024'),
            SizedBox(height: 20),
            // Autorización
            Text('Autorización:'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Número de autorización',
              ),
            ),
            SizedBox(height: 20),
            // Botones
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para cancelar factura
                    _cancelarFactura(context);
                  },
                  child: Text('Cancelar Factura'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para guardar autorización
                    _guardarAutorizacion(context);
                  },
                  child: Text('Guardar Autorización'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _cancelarFactura(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Cancelar Factura'),
        content: Text('¿Estás seguro de que deseas cancelar la factura?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el diálogo
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Lógica de cancelación aquí
              Navigator.of(context).pop(); // Cerrar el diálogo
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Factura cancelada.')),
              );
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void _guardarAutorizacion(BuildContext context) {
    // Lógica para guardar la autorización
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Autorización guardada.')),
    );
  }
}
