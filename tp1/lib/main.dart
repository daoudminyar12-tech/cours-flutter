import 'package:flutter/material.dart';

void main() => runApp(const MyTextField());

class MyTextField extends StatelessWidget {
  const MyTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Récupérer le contenu d\'un textField'),
        ),
        body: const Center(child: RecupererValeurTextField()),
      ),
    );
  }
}

class RecupererValeurTextField extends StatefulWidget {
  const RecupererValeurTextField({super.key});

  @override
  State createState() =>
      _RecupererValeurTextFieldState();
}

class _RecupererValeurTextFieldState extends State {
  final valeurTextFieldcontroller = TextEditingController();

  String resultat = '';

  recupererDonneesTextFields() {
    setState(() {
      resultat = valeurTextFieldcontroller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              width: 400,
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: valeurTextFieldcontroller,
                autocorrect: true,
                decoration:
                    const InputDecoration(hintText: 'Ecrivez du texte ici'),
              )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 23, 58, 255),
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontStyle: FontStyle.normal),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            onPressed: recupererDonneesTextFields,
            child: const Text(
                'Cliquez ici pour récupérer les données saisies dans le champ de texte'),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Le texte saisi est = $resultat",
                  style: const TextStyle(fontSize: 20)))
        ],
      ),
    ));
  }
}
