import 'package:flutter/material.dart';

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

        colorScheme: .fromSeed(seedColor: Colors.cyanAccent),
      ),
      home: const MyHomePage(title: 'Formulário'),
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

  DateTime? dataSelecionada;
  final TextEditingController controllerData = TextEditingController();

  bool aceitouTermos = false;
  bool aceitouNotificacoes = false;

  String? estadoCivil;

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
              Container(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Nome",
                  hintText: "Digite o seu nome",
                  border: OutlineInputBorder(),
                ),
                controller: controllerNome,
              ),
              Container(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Idade",
                  hintText: "Digite a sua idade",
                  border: OutlineInputBorder(),
                ),
                controller: controllerIdade,
              ),
              Container(height: 20),
              TextField(
                controller: controllerData,
                decoration: InputDecoration(
                  labelText: "Data de nascimento",
                  hintText: "Insira a sua data de nascimento",
                  border: OutlineInputBorder(),
                ),
                onTap: () async{
                  DateTime? data = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                  );
                  if (data != null) {
                    setState(() {
                      dataSelecionada = data;
                      controllerData.text =
                      "${data.day}/${data.month}/${data.year}";
                    });
                  }
                }
              ),
              Container(height: 20),
              Text("Aceito os termos:"),
              Checkbox(
                value: aceitouTermos,
                onChanged: (value) {
                  setState(() {
                    aceitouTermos = value!;
                  });
                },
              ),
              Container(height: 20),
              Text("Notificações:"),
              Switch(
                value: aceitouNotificacoes,
                onChanged: (value) {
                  setState(() {
                    aceitouNotificacoes = value;
                  });
                },
              ),
              Container(height: 20),
              DropdownButton<String>(
                value: estadoCivil,
                hint: Text("Selecione o estado civil"),
                items: ["Solteiro(a)", "Casado(a)", "Viúvo(a)"]
                    .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(item),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    estadoCivil = value;
                  });
                },
              )
            ],
          ),
        ),
      );
    }
  }
