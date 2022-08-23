import 'package:app_colories/widgets/buttonsGen.dart';
import 'package:app_colories/widgets/sliderGen.dart';
import 'package:app_colories/widgets/textDesign.dart';
import 'package:app_colories/widgets/textfieldGen.dart';
import 'package:flutter/material.dart';
import '../widgets/switchGen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  bool interrupteur = false;
  DateTime? date;
  double? age;
  double sliderValues = 100;
  int? itemSelectionne;
  double? textfieldValue;
  int calorieBase = 0;
  int? calorieAvecActivite;
  Map sportActivity = {
    'Faible': 0,
    'Modéré': 1,
    'Forte': 3,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: setcolor(),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 10.0, right: 10.0, bottom: 40.0),
              child: 
              TextDesign("Remplissez tout les champs pour obtenir votre besion journalier en calories.", factor: 1.2),
            ),
            Card(
              elevation: 10,
              margin: const EdgeInsets.all(15),
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextDesign("Femme", color: Colors.pink),
                      SwitchGen(interrupteur, switchManager, activecolor: setcolor(), inactivecolor: setcolor()),
                      TextDesign("Homme", color: Colors.blue),
                    ]),

            ButtonsGen(montrerDate , color: setcolor() , child: TextDesign((date == null) ? "Entrer votre age" : "Votre age est de:${age?.toInt()}",color: Colors.white,factor: 1.2,),),

                TextDesign( "Votre taille est de: ${sliderValues.toInt()} cm" , color: setcolor() ),
                SliderGen( sliderValues, slidermanager , activecolor: setcolor() , inactivecolor: setcolor() ),
                padding(),
                    TextfieldGen(onsubmitted: textfieldmanager , cursorcolor: setcolor(),),
                padding(),
                TextDesign( "Quelle est votre activité sportive?",color: setcolor(),factor: 1.3,),
                padding(),
                radiosport(),
                padding()
              ]),
            ),
            ButtonsGen(calculerNombreDeCalories , color: setcolor() , child:TextDesign("Calculer",color: Colors.white ) ),

          ]),
        ));
  }

  Padding padding() {
    return const Padding(padding: EdgeInsets.only(top: 20.0));
  }

  void textfieldmanager(String string){
         setState(() {
        textfieldValue = double.tryParse(string)!;
       });
  }

  void slidermanager(double b) {
    setState(() {
      sliderValues = b;
    });
  }

  void switchManager(bool state) {
    setState(() {
      interrupteur = state;
    });
  }

  MaterialColor setcolor() {
    if (interrupteur == false) {
      return Colors.blue;
    } else {
      return Colors.pink;
    }
  }

  Row radiosport() {
    List<Widget> l = [];
    sportActivity.forEach((key, value) {
      Column colonne = Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Radio<int>(
              value: value,
              activeColor: setcolor(),
              groupValue: itemSelectionne,
              onChanged: (int? i) {
                setState(() {
                  itemSelectionne = i!;
                });
              }),
          TextDesign(key,color: setcolor() ),
        ],
      );
      l.add(colonne);
    });
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: l);
  }

  Future<Null> montrerDate() async {
    DateTime? choix = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2045));
    if (choix != null) {
      setState(() {
        date = choix;
        age = ((DateTime.now().difference(date!).inDays) / 365);
      });
    }
  }

  Future<Null> alerte() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: TextDesign("Erreur"),
            content: TextDesign("Tous les champs ne sont pas remplis"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(buildContext);
                  },
                  child: TextDesign("OK", color: Colors.red))
            ]);
        });
  }

  Future<Null> dialogue() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return SimpleDialog(
            title: TextDesign("Votre besoin en calories", color: setcolor()),
            contentPadding: const EdgeInsets.all(15.0),
            children:[
              padding(),
              TextDesign("Votre besoin de base est de: $calorieBase Kcal"),
              padding(),
              TextDesign("Votre besoin avec activité sportive est de : $calorieAvecActivite kcal"),
              RaisedButton(
                color: setcolor(),
                onPressed: () {
                  Navigator.pop(buildContext);
                },
                child: TextDesign("OK", color: Colors.white),
              )
            ],
          );
        });
  }

    void calculerNombreDeCalories() {
    if (age != null && textfieldValue != null && itemSelectionne != null) {
      //Calculer
      if (interrupteur) {
        calorieBase = (66.4730 +(13.7516 * textfieldValue!) + (5.0033 * sliderValues) - (6.7550 * age!)).toInt();
      } 
      else {
        calorieBase = (655.0955 + (9.5634 * textfieldValue!) + (1.8496 * sliderValues) - (4.6756 * age!)).toInt();
      }
      switch (itemSelectionne) {
        case 0:
          calorieAvecActivite = (calorieBase * 1.2).toInt();
          break;
        case 1:
          calorieAvecActivite = (calorieBase * 1.5).toInt();
          break;
        case 2:
          calorieAvecActivite = (calorieBase * 1.8).toInt();
          break;
        default:
          calorieAvecActivite = calorieBase;
          break;
      }
      setState(() {
        dialogue();
      });
    } else {
      alerte();
    }
  }
}