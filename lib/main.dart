import 'package:calculator_app/constants/colors.dart';
import 'package:calculator_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MainApp());
}

List<String> buttonsList = [
  'ac',
  'del',
  '%',
  '/',
  '7',
  '8',
  '9',
  '*',
  '4',
  '5',
  '6',
  '-',
  '1',
  '2',
  '3',
  '+',
  '00',
  '0',
  '.',
  '=',
];

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String userInput = "";
  String answer = "";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate responsive padding and spacing
    final double paddingValue = screenWidth * 0.05;
    final double textFontSize = screenWidth * 0.08;
    final double buttonPadding = screenWidth * 0.12;
    final double gridSpacing = screenWidth * 0.05;

    void updateText(String text) {
      setState(() {
        userInput += text;
      });
    }

    void clearButton() {
      setState(() {
        userInput = "";
        answer = "";
      });
    }

    void equalButton() {
      String finaluserinput = userInput;
      finaluserinput = userInput.replaceAll('x', '*');
      Parser p = Parser();
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      setState(() {
        answer = exp.evaluate(EvaluationType.REAL, cm).toString();
      });
    }

    void deleteButton() {
      setState(() {
        userInput = userInput.substring(0, userInput.length - 1);
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: bgColor,
          body: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: paddingValue,
                      top: screenHeight * 0.045,
                    ),
                    child: Text(
                      userInput,
                      style: TextStyle(
                        color: upperTextColor,
                        fontSize: textFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      right: paddingValue,
                      top: screenHeight * 0.045,
                      bottom: screenHeight * 0.1,
                    ),
                    child: Text(
                      answer,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: textFontSize * 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: buttonsList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: ((context, index) {
                    if (index == 0) {
                      return CalculatorButton(
                        buttonColor: clearButtonsColor,
                        onPressed: () {
                          clearButton();
                        },
                        text: buttonsList[index],
                      );
                    } else if (index == 1) {
                      return CalculatorButton(
                        buttonColor: clearButtonsColor,
                        onPressed: () {
                          deleteButton();
                        },
                        text: buttonsList[index],
                      );
                    } else if (index == 2 ||
                        index == 3 ||
                        index == 7 ||
                        index == 11 ||
                        index == 15) {
                      return CalculatorButton(
                        buttonColor: symbolsButtonColor,
                        onPressed: () {
                          updateText(buttonsList[index]);
                        },
                        text: buttonsList[index],
                      );
                    } else if (index == buttonsList.length - 1) {
                      return CalculatorButton(
                        buttonColor: symbolsButtonColor,
                        onPressed: () {
                          equalButton();
                        },
                        text: buttonsList[index],
                      );
                    } else {
                      return CalculatorButton(
                        buttonColor: defaultButtonColor,
                        onPressed: () {
                          updateText(buttonsList[index]);
                        },
                        text: buttonsList[index],
                      );
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
