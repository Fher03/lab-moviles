import 'package:flutter/material.dart';

class CreateFacturaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Factura App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FacturaForm(),
    );
  }
}

class FacturaForm extends StatefulWidget {
  @override
  _FacturaFormState createState() => _FacturaFormState();
}

class _FacturaFormState extends State<FacturaForm> {
  final _formKey = GlobalKey<FormState>();
  String _nombreCliente = '';
  double _monto = 0.0;
  String _descripcion = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aquí puedes procesar la factura (guardar en una base de datos, etc.)
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Factura Creada'),
          content: Text(
              'Cliente: $_nombreCliente\nMonto: $_monto\nDescripción: $_descripcion'),
          actions: [
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Factura'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre del Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el nombre del cliente';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nombreCliente = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Monto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un monto';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Por favor ingresa un monto válido';
                  }
                  return null;
                },
                onSaved: (value) {
                  _monto = double.parse(value!);
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descripción'),
                onSaved: (value) {
                  _descripcion = value ?? '';
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Crear Factura'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
