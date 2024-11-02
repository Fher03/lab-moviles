import 'package:flutter/material.dart';

class FacturaPendiente {
  final String nombre;
  final String fecha;
  final String hora;
  final String ruta; // Ruta específica para cada factura

  FacturaPendiente({
    required this.nombre,
    required this.fecha,
    required this.hora,
    required this.ruta,
  });
}

class FacturasPendientesView extends StatelessWidget {
  final List<FacturaPendiente> facturasPendientes = [
    FacturaPendiente(
      nombre: "Factura 1",
      fecha: "01/11/2024",
      hora: "10:30 AM",
      ruta: "/factura1",
    ),
    FacturaPendiente(
      nombre: "Factura 2",
      fecha: "01/11/2024",
      hora: "11:00 AM",
      ruta: "/factura2",
    ),
    FacturaPendiente(
      nombre: "Factura 3",
      fecha: "01/11/2024",
      hora: "11:30 AM",
      ruta: "/factura3",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("GASOLINERA"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FACTURAS PENDIENTES",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: facturasPendientes.length,
                itemBuilder: (context, index) {
                  final factura = facturasPendientes[index];
                  return FacturaCard(
                    factura: factura,
                    onTap: () {
                      Navigator.pushNamed(context, factura.ruta);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FacturaCard extends StatelessWidget {
  final FacturaPendiente factura;
  final VoidCallback onTap;

  FacturaCard({required this.factura, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        color: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                factura.nombre,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text("Fecha: ${factura.fecha}"),
              Text("Hora: ${factura.hora}"),
            ],
          ),
        ),
      ),
    );
  }
}

// Ejemplo de rutas
void main() {
  runApp(MaterialApp(
    home: FacturasPendientesView(),
    routes: {
      '/factura1': (context) => FacturaDetallePage(facturaNombre: 'Factura 1'),
      '/factura2': (context) => FacturaDetallePage(facturaNombre: 'Factura 2'),
      '/factura3': (context) => FacturaDetallePage(facturaNombre: 'Factura 3'),
    },
  ));
}

class FacturaDetallePage extends StatelessWidget {
  final String facturaNombre;

  FacturaDetallePage({required this.facturaNombre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(facturaNombre),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Text(
          'Detalles de $facturaNombre',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
