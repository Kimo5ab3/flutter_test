import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
    var domande = [
      //creazione di semplici Mappe chiave-valore per gestire domande e risposte
      //oggetti derivati dalla classe Map
      {
        'questionText':'Qual è il tuo colore preferito?',
        'answers':[
          'Verde','Arancione','Blu','Rosso'
        ],
      },
      {
        'questionText':'Qual è il tuo animale preferito?',
        'answers':[
          'Cane','Gatto','Gorilla','Scimmia'
        ]
      },
      {
        'questionText':'Qual è il tuo sport preferito?',
        'answers':[
          'Trail','Calcio','Powerlifting','Gravel','Kettlebell'
        ]
      }


    ];
    //build() ritorna un widget
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Domande')),
      body: Column(
        children: <Widget>[
          Question(domande[_indiceDomanda]['questionText']),
          ...(domande[_indiceDomanda]['answers'] as List<String>).map((domanda){
            return Answer(_answerQuestion, domanda);
          }).toList()
        ],
      ),
    )); //MaterialApp è un widget di Flutter che accetta parametri denominati es-> home
  }
}
