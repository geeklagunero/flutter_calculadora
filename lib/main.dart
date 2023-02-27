import 'package:calculadora/widgets/calcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main(List<String> args){
  runApp(const CalculadoraApp());
}


class CalculadoraApp extends StatefulWidget {
  const CalculadoraApp({Key? key}) : super(key: key);

  @override
  State<CalculadoraApp> createState() => _CalculadoraAppState();
}

class _CalculadoraAppState extends State<CalculadoraApp> {

  String _history = "";
  String _expression = "";

  void clear(String text){
    setState(() {
      _expression = "";
    });

  }

  void allClear(String text){
    setState(() {
      _history = "";
      _expression = "";
    });

  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });

  }

  void numeroClick(String text){
    setState(() {
      _expression += text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: const Color(0xFF283637),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding:const EdgeInsets.only(right: 12),
                  child: Text(_history, style: GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 24, color: Color(0xFF545F61))),),
                ),
              ),
              Container(
                alignment: const Alignment(1.0, 1.0),
                child: Padding(
                  padding:const EdgeInsets.all(12),
                  child: Text(_expression, style: GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 48, color: Colors.white)),),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    bgColor: 0xFF00BF45,
                    text: "AC",
                    callback: allClear,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgColor: 0xffE3303A,
                    text: "C",
                    callback: clear,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "%",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "/",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: "7",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "8",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "9",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "*",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: "4",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "5",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "6",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "-",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: "3",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "2",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "1",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "+",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: ".",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "0",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "00",
                    callback: numeroClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "=",
                    callback: evaluate,
                    textSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

