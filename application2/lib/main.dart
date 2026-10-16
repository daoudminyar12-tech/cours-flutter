import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DeuxMethodesPage(),
    );
  }
}

class DeuxMethodesPage extends StatefulWidget {
  const DeuxMethodesPage({super.key});

  @override
  State<DeuxMethodesPage> createState() => _DeuxMethodesPageState();
}

class _DeuxMethodesPageState extends State<DeuxMethodesPage> {
  
  final TextEditingController _controller = TextEditingController();
  String resultatController = '';

  String resultatOnChanged = '';

  void _afficherTexte() {
    setState(() {
      resultatController = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextEditingController + onChanged'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Méthode 1 : TextEditingController',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texte (récupéré au clic)',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _afficherTexte,
              child: const Text('Afficher'),
            ),
            const SizedBox(height: 10),
            Text(
              'Résultat : $resultatController',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),

            const Divider(height: 40, thickness: 2),

            const Text(
              'Méthode 2 : onChanged',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (valeur) {
                setState(() {
                  resultatOnChanged = valeur;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Texte (récupéré en direct)',
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Résultat : $resultatOnChanged',
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}