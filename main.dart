import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State {
  final _textController1 = TextEditingController();
  final _textController2 = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    _textController1.dispose();
    _textController2.dispose();
    super.dispose();
  }

  void _handleSubmitted() {
    final int value1 = int.tryParse(_textController1.text) ?? 0;
    final int value2 = int.tryParse(_textController2.text) ?? 0;
    final int sum = value1 + value2;
    setState(() {
      _result = 'La somme de $value1 et $value2 est $sum';
      _textController1.clear();
      _textController2.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textController1,
                decoration: InputDecoration(
                  hintText: 'Entrez un nombre',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _textController2,
                decoration: InputDecoration(
                  hintText: 'Entrez un nombre',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _handleSubmitted,
                child: Text('Valider'),
              ),
              SizedBox(height: 20),
              Text(_result),
            ],
          ),
        ),
      ),
    );
  }
}
