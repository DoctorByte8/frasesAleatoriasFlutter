import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(
    MaterialApp(
      title: "Frases Aleatórias",
      debugShowCheckedModeBanner: false,
      home: MainApp()
    )
  );
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();
}


class MainAppState extends State<MainApp>{
  static const caracteres = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random rand = Random();

  void getRandomString() => setState((){
    fraseAleatoria = String.fromCharCodes(Iterable.generate(20, (_) => caracteres.codeUnitAt(rand.nextInt(caracteres.length))));
  });

  String fraseAleatoria = "Clique abaixo para gerar um texto aleatorio!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frases Aleatórias"),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.blue),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("../images/icone.png", height: (MediaQuery.sizeOf(context).width/1.5)),
                Text(
                  fraseAleatoria,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  )),
                ElevatedButton(
                  onPressed: getRandomString,
                  child: Text("Clique aqui para nova frase"))
              ],
            )
          )
        )
    );
  }
}