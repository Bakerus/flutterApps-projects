import 'package:flutter/material.dart';

class TextfieldGen extends TextField{

  TextfieldGen( { cursorcolor = Colors.black , keyboardtype = TextInputType.number, required void Function ( String textfieldState ) onsubmitted , decoration =  const InputDecoration(labelText:"Entrer votre poids en Kg ") }):super(
   
    cursorColor: cursorcolor,
    keyboardType: keyboardtype,
    onSubmitted: onsubmitted ,
    decoration: decoration,
  
  );


}