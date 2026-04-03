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
  final focusNome = FocusNode();

  final controllerIdade = TextEditingController();
  final focusIdade = FocusNode();

  final controllerEmail = TextEditingController();
  final focusEmail = FocusNode();

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text("Preencha os campos abaixo:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              focusNode: focusNome,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).requestFocus(focusIdade),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                labelText: "Nome",
                hintText: "Digite o seu nome",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
              ),
              controller: controllerNome,
            ),
            SizedBox(height: 20),
            TextField(
              focusNode: focusIdade,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => FocusScope.of(context).requestFocus(focusEmail),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                labelText: "Idade",
                hintText: "Digite a sua idade",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              controller: controllerIdade,
            ),
            SizedBox(height: 20),
            TextField(
              focusNode: focusEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                labelText: "E-mail",
                hintText: "Digite o seu e-mail",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              controller: controllerEmail,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: sexoUsuario,
                  hint: Text("Selecione o seu sexo"),
                  isExpanded: true,
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
              ),
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ),
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
