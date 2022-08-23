import 'package:flutter/material.dart';

  class SliderGen extends Slider {
    SliderGen( double value , void Function(double sliderState) onchanged ,{miN=100.0 , maX=300.0 , activecolor = Colors.white , inactivecolor = Colors.black }) :super(
      value: value,
      onChanged: onchanged,
      min: miN,
      max: maX,
      activeColor: activecolor,
      inactiveColor: inactivecolor

      );
  }