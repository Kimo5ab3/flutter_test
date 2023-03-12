import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

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
  int _totalScore = 0;
  // con il segno di underscore prima di una proprietà o un metodo rendiamo privato il metodo o la proprietà
  void _answerQuestion(int score) {
    setState(() {
      _totalScore = _totalScore + score;
      _indiceDomanda += 1;
    });
    //print(indiceDomanda);
  }

  //Test di una funzione che diminuisce di 1 _indiceDomanda
  // void _minusAnswerQuestion() {
  //   setState(() {
  //     _indiceDomanda -= 1;
  //   });
  // }

  //sovrascrittura del metodo build() della classe StatelessWidget passando come parametro un oggetto speciale di Flutter: BuildContext
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var _domande = [
      //creazione di semplici Mappe chiave-valore per gestire domande e risposte
      //oggetti derivati dalla classe Map
      {
        'questionText': 'Qual è la capitale dell’Australia?',
        'answers': [
          {'txt': 'Canberra', 'score': 10},
          {'txt': 'Sidney', 'score': 0},
          {'txt': 'Melbourne', 'score': 0},
          {'txt': 'Brisbaine', 'score': 0}
        ],
      },
      {
        'questionText':
            'In che anno si sono tenuti gli ultimi Mondiali di calcio in Italia?',
        'answers': [
          {'txt': '1956', 'score': 0},
          {'txt': '2006', 'score': 0},
          {'txt': '1990', 'score': 10},
          {'txt': '1985', 'score': 0}
        ],
      },
      {
        'questionText':
            'Come si chiama il primo lungometraggio di Steven Spielberg?',
        'answers': [
          {'txt': 'Lo Squalo', 'score': 0},
          {'txt': 'Duel', 'score': 10},
          {'txt': 'Salvate il sodato Rayan', 'score': 0},
          {'txt': 'The Post', 'score': 0}
        ],
      },
      {
        'questionText':
            'Quale software house ha inventato Sonic, il porcospino blu?',
        'answers': [
          {'txt': 'Sega', 'score': 10},
          {'txt': 'Blizzard', 'score': 0},
          {'txt': 'Respawn', 'score': 0},
          {'txt': 'Sony', 'score': 0}
        ],
      },
    ];
    //build() ritorna un widget
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Domande')),
        body: _indiceDomanda < _domande.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _indiceDomanda,
                domande: _domande,
              )
            : Result(_totalScore),
      ),
    ); //MaterialApp è un widget di Flutter che accetta parametri denominati es-> home
  }
}
