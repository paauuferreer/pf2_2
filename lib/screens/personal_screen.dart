// Justificació: S'ha triat un StatefulWidget perquè la pantalla gestiona estat local
// mutable mitjançant controladors de text i necessita alliberar la memòria en el dispose().
// A més, requereix reactivitat per actualitzar el camp de la data de naixement quan
// l'usuari la selecciona mitjançant el diàleg showDatePicker.

import 'package:flutter/material.dart';
import '../models/persona.dart';

class PersonalScreen extends StatefulWidget {
  final Persona persona;

  const PersonalScreen({super.key, required this.persona});

  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nomController;
  late final TextEditingController _llinatgesController;
  late final TextEditingController _correuController;
  late final TextEditingController _contrasenyaController;
  late final TextEditingController _dataNaixementController;

  @override
  void initState() {
    super.initState();
    _nomController = TextEditingController(text: widget.persona.nom);
    _llinatgesController = TextEditingController(text: widget.persona.llinatges);
    _correuController = TextEditingController(text: widget.persona.correu);
    _contrasenyaController = TextEditingController(text: widget.persona.contrasenya);
    _dataNaixementController = TextEditingController(text: widget.persona.dataNaixement);
  }

  @override
  void dispose() {
    _nomController.dispose();
    _llinatgesController.dispose();
    _correuController.dispose();
    _contrasenyaController.dispose();
    _dataNaixementController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ferrer - Edit Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nomController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Aquest camp és obligatori';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _llinatgesController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Aquest camp és obligatori';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _correuController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Aquest camp és obligatori';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _contrasenyaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Aquest camp és obligatori';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dataNaixementController,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Date of Birth',
                  border: OutlineInputBorder(),
                ),
                onTap: () async {
                  DateTime? dataTriada = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (dataTriada != null) {
                    String dia = dataTriada.day.toString().padLeft(2, '0');
                    String mes = dataTriada.month.toString().padLeft(2, '0');
                    String any = dataTriada.year.toString();
                    _dataNaixementController.text = '$dia/$mes/$any';
                  }
                },
                validator: (valor) {
                  if (valor == null || valor.trim().isEmpty) {
                    return 'Aquest camp és obligatori';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final personaActualitzada = widget.persona.copyWith(
                      nom: _nomController.text.trim(),
                      llinatges: _llinatgesController.text.trim(),
                      correu: _correuController.text.trim(),
                      contrasenya: _contrasenyaController.text.trim(),
                      dataNaixement: _dataNaixementController.text.trim(),
                    );
                    Navigator.pop(context, personaActualitzada);
                  }
                },
                child: const Text('Save and Return'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
