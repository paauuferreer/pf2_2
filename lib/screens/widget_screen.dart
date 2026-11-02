// Justificació: S'ha triat un StatefulWidget perquè la pantalla requereix reactivitat
// per gestionar i modificar en memòria la llista d'elements quan l'usuari interactua
// eliminant ítems lliscant amb el widget Dismissible mitjançant setState.

import 'package:flutter/material.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  final List<String> _tecnologies = [
    'Flutter',
    'Dart',
    'Android Studio',
    'Java',
    'Git & GitHub',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dismissible & ExpansionTile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ExpansionTile(
            title: Text('Informació addicional (ExpansionTile)'),
            leading: Icon(Icons.info_outline),
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Aquest component permet desplegar i amagar contingut de manera animada en fer-hi clic.',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Llista de tecnologies (Dismissible):',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          ..._tecnologies.map((tecnologia) {
            return Dismissible(
              key: Key(tecnologia),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                color: Colors.red,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                setState(() {
                  _tecnologies.remove(tecnologia);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$tecnologia eliminat'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.code),
                  title: Text(tecnologia),
                  subtitle: const Text('Llisca cap a l\'esquerra per eliminar'),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
