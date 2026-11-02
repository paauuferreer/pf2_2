// Justificació: S'ha triat un StatefulWidget perquè la pantalla requereix reactivitat.
// Necessita mantenir en memòria l'estat de la Persona i actualitzar la interfície
// mitjançant setState quan rebem les dades modificades des de PersonalScreen.

import 'package:flutter/material.dart';
import '../models/persona.dart';
import 'personal_screen.dart';
import 'widget_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Persona persona = Persona();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DevProfile M3'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text('Nom complet'),
                    subtitle: Text(persona.nomComplet),
                  ),
                  ListTile(
                    title: const Text('Correu electrònic'),
                    subtitle: Text(persona.correu),
                  ),
                  ListTile(
                    title: const Text('Data de naixement'),
                    subtitle: Text(persona.dataNaixement),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final personaActualitzada = await Navigator.push<Persona>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalScreen(persona: persona),
                  ),
                );
                if (personaActualitzada != null) {
                  setState(() {
                    persona = personaActualitzada;
                  });
                }
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WidgetScreen()),
                );
              },
              child: const Text('Explore Widget Showcase'),
            ),
          ],
        ),
      ),
    );
  }
}
