import 'package:flutter/material.dart';
import 'package:pedra_papel_tesoura/Resultado.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepOrange),
      ),
        home: Resultado(title: 'Pedra Papel Tesoura'),
      // home: const MyHomePage(title: 'Pedra Papel Tesoura'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Container(height: 10),
            Container(
              child: Image.asset('images/padrao.png'),
            ),
            Text('Escolha do App'),
            Container(height: 100),
            Row(mainAxisAlignment:.spaceAround,
                children: [
              Container(
                child: Image.asset('images/pedra.png'),
                width: 100,
              ),
              Container(
                child: Image.asset('images/papel.png'),
                  width: 100,
              ),
              Container(
                child: Image.asset('images/tesoura.png'),
                  width: 100,
              )])
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
