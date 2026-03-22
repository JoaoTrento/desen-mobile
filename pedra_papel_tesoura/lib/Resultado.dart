import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {
  final String title;
  final int escolhaUsuario;
  final int escolhaMaquina;

  const Resultado({
    super.key,
    required this.title,
    required this.escolhaUsuario,
    required this.escolhaMaquina,
  });

  @override
  State<Resultado> createState() => _ResultadoState();
}

Widget getImagemEscolhaUsuario(int escolha) {
  switch (escolha) {
    case 1:
      return Image.asset('assets/images/pedra.png');
    case 2:
      return Image.asset('assets/images/papel.png');
    case 3:
      return Image.asset('assets/images/tesoura.png');
    default:
      return Image.asset('assets/images/padrao.png');
  }
}

Widget getImagemEscolhaMaquina(int escolha) {
  switch (escolha) {
    case 1:
      return Image.asset('assets/images/pedra.png');
    case 2:
      return Image.asset('assets/images/papel.png');
    case 3:
      return Image.asset('assets/images/tesoura.png');
    default:
      return Image.asset('assets/images/padrao.png');
  }
}

Widget geraResultadoImagem(int escolhaUsuario, int escolhaMaquina) {
  if (escolhaUsuario == escolhaMaquina) {
    return Image.asset('assets/images/icons8-aperto-de-maos-100.png', height: 125, width: 125, fit: BoxFit.contain);
  } else if ((escolhaUsuario == 3) && (escolhaMaquina == 1)) {
    return Image.asset('assets/images/icons8-perder-48.png', height: 125, width: 125, fit: BoxFit.contain);
  } else if (escolhaUsuario > escolhaMaquina) {
    return Image.asset('assets/images/icons8-vitoria-48.png', height: 125, width: 125, fit: BoxFit.contain);
  } else {
    return Image.asset('assets/images/icons8-perder-48.png', height: 125, width: 125, fit: BoxFit.contain);
  }
}

String geraResultadoTexto(int escolhaUsuario, int escolhaMaquina) {
  if (escolhaUsuario == escolhaMaquina) {
    return 'Empatou!';
  } else if ((escolhaUsuario == 3) && (escolhaMaquina == 1)) {
    return 'Você Perdeu!';
  } else if (escolhaUsuario > escolhaMaquina) {
    return 'Você Ganhou!!!';
  } else {
    return 'Você Perdeu!';
  }
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
              child: getImagemEscolhaMaquina(widget.escolhaMaquina),
            ),
            Text('Escolha do App'),
            Container(height: 50),
            Container(
              child: getImagemEscolhaUsuario(widget.escolhaUsuario),
            ),
            Text('Sua Escolha'),
            Container(height: 50),
            Container(
              child: geraResultadoImagem(widget.escolhaUsuario, widget.escolhaMaquina)
            ),
            Text(geraResultadoTexto(widget.escolhaUsuario, widget.escolhaMaquina)),
            const SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
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