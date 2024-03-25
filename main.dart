import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo #1 - Contador de Pessoas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Aplicativo #1 - Contador de Pessoas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static const int maxPessoas = 10;
  Color _backgroundColor = Colors.white; // Cor de fundo inicial

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }
//Exercício 2 ------------------------------------Gabriel Vitória
  void _changeBackgroundColor() {
    setState(() {
      // Lista de 3 cores possíveis
      List<Color> availableColors = [
        Colors.blue,
        Colors.white,
        Colors.black,
      ];

      // Escolhendo uma cor aleatória da lista
      _backgroundColor = availableColors[Random().nextInt(availableColors.length)];
    });
  }
//--------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            // Resposta do exercício 1---------------------------Gabriel Vitória 24/03/2024
            if (_counter > maxPessoas)
              const Text(
                'Limite de Pessoas Excedido!',
                style: TextStyle(color: Colors.red),
              ),
              //-------------------------------------------------
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 16), // Espaçamento entre botões
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16),

          //Exercicio 2 ---------------------------- Gabriel Vitória
          FloatingActionButton(
            onPressed: _changeBackgroundColor, // Altera a cor de fundo
            tooltip: 'Mudar Cor de Fundo',
            child: const Icon(Icons.color_lens),
          ),
          // ---------------------------------------
        ],
      ),
      backgroundColor: _backgroundColor, // Define a cor de fundo dinamicamente
    );
  }
}
