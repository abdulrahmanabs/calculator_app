import 'package:calculator_app/constants/colors.dart';
import 'package:flutter/material.dart';

// class CalculatorButton extends StatelessWidget {
//   CalculatorButton(
//       {super.key,
//       required this.onPressed,
//       required this.buttonColor,
//       required this.text});

//   VoidCallback onPressed;
//   Color buttonColor;
//   String text;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20), color: buttonColor),
//       padding: EdgeInsets.all(5),
//       margin: EdgeInsets.all(8),
//       child: Center(
//         child: RawMaterialButton(
//           onPressed: onPressed,
//           child: Text(
//             text,
//             style: TextStyle(
//                 fontSize: 50,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
// }

class CalculatorButton extends StatefulWidget {
  CalculatorButton({
    Key? key,
    required this.onPressed,
    required this.buttonColor,
    required this.text,
  }) : super(key: key);

  VoidCallback onPressed;
  Color buttonColor;
  String text;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.buttonColor,
      ),
      margin: EdgeInsets.all(8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.onPressed,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: EdgeInsets.all(20), // Adjust the padding as needed
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
