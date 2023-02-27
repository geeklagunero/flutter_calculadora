import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final int bgColor;
  const CalcButton({Key? key, required this.callback, required this.text, this.textSize=28, this.bgColor=0xFF21252B}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: ()=>{callback(text)},
          style: TextButton.styleFrom(
            backgroundColor: Color(bgColor),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20),
          ),
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: this.textSize
            ),
          ),
        ),
      ),
    );
  }
}
