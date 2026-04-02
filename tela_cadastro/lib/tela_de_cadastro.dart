import 'package:flutter/material.dart';
import 'tela_de_confirmacao.dart';

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

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
      ),
      home: const MyHomePage(title: 'Cadastro de Usuário'),
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
  final controllerNome = TextEditingController();
  final controllerIdade = TextEditingController();
  final controllerEmail = TextEditingController();

  bool aceitouTermos = false;

  String? sexoUsuario;

  bool _validarCampos(BuildContext context) {
    if (controllerNome.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('O nome não pode ser vazio')),
      );
      return false;
    }

    if (controllerIdade.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('A idade não pode ser vazia')),
      );
      return false;
    }

    int idade = int.parse(controllerIdade.text);
    if (idade < 18) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('A idade não pode ser menor que 18')),
      );
      return false;
    }

    if ((controllerEmail.text.isEmpty) || (!controllerEmail.text.contains("@"))) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Use um e-mail válido')),
      );
      return false;
    }

    if (sexoUsuario == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Selecione o seu sexo')),
      );
      return false;
    }

    if (!aceitouTermos) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Aceite os termos de uso')),
      );
      return false;
    }

    return true;
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
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Nome",
                hintText: "Digite o seu nome",
                border: OutlineInputBorder(),
              ),
              controller: controllerNome,
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Idade",
                hintText: "Digite a sua idade",
                border: OutlineInputBorder(),
              ),
              controller: controllerIdade,
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                hintText: "Digite o seu e-mail",
                border: OutlineInputBorder(),
              ),
              controller: controllerEmail,
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: sexoUsuario,
              hint: Text("Selecione o seu sexo"),
              items: ["Masculino", "Feminino", "Prefiro não informar"]
                  .map((item) => DropdownMenuItem(
                value: item,
                child: Text(item),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  sexoUsuario = value;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: aceitouTermos,
                  onChanged: (value) {
                    setState(() {
                      aceitouTermos = value!;
                    });
                  },
                ),
                Text("Aceito os termos"),
              ]
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  if (_validarCampos(context)) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => Confirmacao(
                        nome: controllerNome.text,
                        idade: controllerIdade.text,
                        email: controllerEmail.text,
                        sexo: sexoUsuario!,
                        aceitouTermos: aceitouTermos,
                      )),
                    );
                  }
                },
              child: Text('Cadastrar'),
            )
          ],
        ),
      ),
    );
  }
}
