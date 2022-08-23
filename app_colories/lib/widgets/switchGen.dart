import 'package:flutter/material.dart';

class SwitchGen extends Switch {

    SwitchGen( bool value , void Function(bool b) onChanged ,{ activecolor = Colors.white, inactivecolor = Colors.black } ) :super (
      value: value,
      onChanged: onChanged,
      activeColor: activecolor,
      inactiveThumbColor: inactivecolor
    );

} 