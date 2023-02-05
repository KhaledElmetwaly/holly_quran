import 'package:flutter/material.dart';
import 'package:holly_quran/core/arabic_number_converter.dart';

class ArabicSurahNumber extends StatelessWidget {
  final int i;
  ArabicSurahNumber({
    Key? key,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3E" + (i + 1).toString().toArabicNumbers + "\uFD3F",
      style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: 'me_quran',
          fontSize: 20,
          shadows: [
            Shadow(
              offset: Offset(.5, .5),
              blurRadius: 1.0,
              color: Colors.amberAccent,
            )
          ]),
    );
  }
}
