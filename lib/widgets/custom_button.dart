import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    this.borderRadius,
    this.buttonColor,
    required this.buttonText,
    required this.onTap,
    required this.isBusy,
    this.textColor,
    Key? key,
    this.gradient, this.border,
  }) : super(key: key);

  final VoidCallback onTap;
  final Color? buttonColor;
  final double? borderRadius;
  final Color? textColor;
  final String buttonText;
  final bool isBusy;
  final Gradient? gradient;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return isBusy
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ],
          )
        : Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: 52,
            decoration: BoxDecoration(
                color: buttonColor,
                gradient: gradient,
                border: border,
                borderRadius: BorderRadius.circular(borderRadius ?? 30)),
            child: InkWell(
                onTap: onTap,
                child: Center(
                  child: Text(buttonText,
                      style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                )),
          );
  }
}



// LinearGradient(
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     colors: [
//                       Color.fromARGB(234, 15, 189, 79),
//                       Color.fromARGB(232, 175, 208, 54)
//                     ]),