import 'package:flutter/material.dart';

class TextDesign extends Text {

  // ignore: use_key_in_widget_constructors
  TextDesign(String valueText, {color =Colors.black , textAlign = TextAlign.center , factor =1.0} ) :super (
    valueText,
    textAlign: textAlign,
    textScaleFactor: factor,
    style: TextStyle(color: color),
  );

  

}