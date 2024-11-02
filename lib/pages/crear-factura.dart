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

  // Campos del formulario
  String _direccionExpedicion = '';
  String _nombreCliente = '';
  int _cantidad = 0;
  String _descripcion = '';
  double _importe = 0.0;
  DateTime? _fecha;
  TimeOfDay? _hora;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Factura Creada'),
          content: Text('Cliente: $_nombreCliente\n'
              'Dirección de Expedición: $_direccionExpedicion\n'
              'Fecha: ${_fecha?.toLocal().toString().split(' ')[0]}\n'
              'Hora: ${_hora?.format(context)}\n'
              'Cantidad: $_cantidad\n'
              'Descripción: $_descripcion\n'
              'Importe: $_importe'),
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

  Future<void> _selectFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _fecha) {
      setState(() {
        _fecha = picked;
      });
    }
  }

  Future<void> _selectHora(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _hora) {
      setState(() {
        _hora = picked;
      });
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration:
                      InputDecoration(labelText: 'Dirección de Expedición'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la dirección de expedición';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _direccionExpedicion = value!;
                  },
                ),
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
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => _selectFecha(context),
                        child: Text(_fecha == null
                            ? 'Seleccionar Fecha'
                            : 'Fecha: ${_fecha!.toLocal().toString().split(' ')[0]}'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () => _selectHora(context),
                        child: Text(_hora == null
                            ? 'Seleccionar Hora'
                            : 'Hora: ${_hora!.format(context)}'),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cantidad'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la cantidad';
                    }
                    if (int.tryParse(value) == null) {
                      return 'Por favor ingresa una cantidad válida';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _cantidad = int.parse(value!);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Descripción'),
                  onSaved: (value) {
                    _descripcion = value ?? '';
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Importe'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el importe';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Por favor ingresa un importe válido';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _importe = double.parse(value!);
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
      ),
    );
  }
}
