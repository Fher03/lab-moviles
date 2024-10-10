import 'package:flutter/material.dart';
import 'package:facturation_app/pages.dart/crear-factura.dart';
import 'package:facturation_app/pages.dart/factura.dart';

// Pantalla "Planta" con dos botones grandes
class PlantaScreen extends StatelessWidget {
  const PlantaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'Planta',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Acción del primer botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateFacturaApp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Crear Facturas',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Acción del segundo botón
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FacturaApp(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[700],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'Facturas',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
