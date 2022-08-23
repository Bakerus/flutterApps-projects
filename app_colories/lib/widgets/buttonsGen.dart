import 'package:app_colories/widgets/textDesign.dart';
import 'package:flutter/material.dart';

  class ButtonsGen extends RaisedButton {

    ButtonsGen( void Function () onpressed , {color=Colors.white , child=TextDesign } ):super(
      onPressed:onpressed,
      color: color,
      child: child,
      );
      

  }