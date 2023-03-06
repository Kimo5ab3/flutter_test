import 'package:flutter/material.dart';

import './question.dart';

//main() è la fuzione di entrata di tutta l'app
void main() {
  //runApp() prende una funzione come parametro (il costruttore della classe MyApp) per avviare l'app
  runApp(MyApp());
}

//Un'alternativa per scrivere le funzioni, in questo caso la build()
// void main() => runApp(MyApp());

// creazione della classe MyApp tramite ereditarietà dalla classe StatelessWidget
//class MyApp extends StatelessWidget

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _indiceDomanda = 0;
  // con il segno di underscore prima di una proprietà o un metodo rendiamo privato il metodo o la proprietà
  void _answerQuestion() {
    setState(() {
      _indiceDomanda += 1;
    });
    //print(indiceDomanda);
  }

  //sovrascrittura del metodo build() della classe StatelessWidget passando come parametro un oggetto speciale di Flutter: BuildContext
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var domande = [
      'Qual è il tuo colore preferito?',
      'Qual è il tuo animale preferito?'
    ];

    //build() ritorna un widget
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Domande')),
      body: Column(
        children: <Widget>[
          Question(domande[_indiceDomanda]),
          ElevatedButton(
            child: Text('Answer1'),
            //richiamando il nome della funzione senza parentesi sto creando un puntatore alla funzione stessa
            onPressed: _answerQuestion,
          ),
          ElevatedButton(
            child: Text('Answer2'),
            onPressed: () => print('Risposta 2 scelta'),
          ),
          ElevatedButton(
            child: Text('Answer3'),
            onPressed: () => print('Risposta 3 scelta'),
          )
        ],
      ),
    )); //MaterialApp è un widget di Flutter che accetta parametri denominati es-> home
  }
}
