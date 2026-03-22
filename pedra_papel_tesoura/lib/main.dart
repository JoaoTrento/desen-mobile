import 'package:flutter/material.dart';
import 'package:pedra_papel_tesoura/Resultado.dart';
import 'dart:math';

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
        colorScheme: .fromSeed(seedColor: Colors.lightBlue),
      ),
      home: const MyHomePage(title: 'Pedra Papel Tesoura'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

int gerarEscolhaMaquina() {
  return Random().nextInt(3) + 1;
}

class _MyHomePageState extends State<MyHomePage> {
  int escolhaUsuario = 0;
  int escolhaMaquina = 0;

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
              child: Image.asset('assets/images/padrao.png'),
            ),
            Text('Escolha do App'),
            Container(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                // PEDRA
                GestureDetector(
                  onTap: () {
                      escolhaUsuario = 1;
                      escolhaMaquina = gerarEscolhaMaquina();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Resultado(
                            title: 'Resultado',
                            escolhaUsuario: escolhaUsuario,
                            escolhaMaquina: escolhaMaquina,
                          ),
                        ),
                      );
                  },
                  child: SizedBox(
                    width: 100,
                    child: Image.asset('assets/images/pedra.png'),
                  ),
                ),

                // PAPEL
                GestureDetector(
                  onTap: () {
                    escolhaUsuario = 2;
                    escolhaMaquina = gerarEscolhaMaquina();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Resultado(
                          title: 'Resultado',
                          escolhaUsuario: escolhaUsuario,
                          escolhaMaquina: escolhaMaquina,
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 100,
                    child: Image.asset('assets/images/papel.png'),
                  ),
                ),

                // TESOURA
                GestureDetector(
                  onTap: () {
                    escolhaUsuario = 3;
                    escolhaMaquina = gerarEscolhaMaquina();
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => Resultado(
                    title: 'Resultado',
                    escolhaUsuario: escolhaUsuario,
                    escolhaMaquina: escolhaMaquina,
                    ),
                    ),
                    );
                  },
                  child: SizedBox(
                    width: 100,
                    child: Image.asset('assets/images/tesoura.png'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
