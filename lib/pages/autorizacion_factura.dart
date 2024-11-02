import 'package:flutter/material.dart';

class FacturaView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Row(
          children: [
            Icon(Icons.business, size: 24), // Logo de la empresa
            SizedBox(width: 8),
            Text("FACTURAS"),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Acción del menú
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Botón de cancelar factura
            Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  // Acción de cancelar factura
                },
                child: Text('Cancelar factura'),
              ),
            ),
            SizedBox(height: 20),

            // Contenedor para el formato de factura
            Expanded(
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Text(
                    'FORMATO FACTURA',
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Sección de autorización
            Divider(thickness: 1, color: Colors.black),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'AUTORIZACIÓN',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        // Manejar cambio de valor de "Gasolinera"
                      },
                    ),
                    Text("Gasolinera"),
                  ],
                ),
                Column(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        // Manejar cambio de valor de "Trailero"
                      },
                    ),
                    Text("Trailero"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
