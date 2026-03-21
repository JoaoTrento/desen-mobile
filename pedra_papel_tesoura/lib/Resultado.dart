import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  const Resultado({super.key, required this.title});

  final String title;

  @override
  State<Resultado> createState() => _ResultadoState();
}

class _ResultadoState extends State<Resultado> {
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
              child: Image.asset('images/papel.png'),
            ),
            Text('Sua Escolha'),
            Container(height: 100),
            Container(
              child: Image.asset('images/pedra.png'),
            ),
            Text('Escolha do App'),
            Container(height: 100),
            Container(
              child: Image.asset('images/icons8-perder-48.png', height: 125, width: 125, fit: BoxFit.contain),
            ),
            Text('Você Perdeu/Venceu!'),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Jogar novamente',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}