import 'package:flutter/material.dart';

class ButtonCart extends StatelessWidget {
  final String title;
  double btnWith;
  double btnHeight;
  Color color;

  ButtonCart(
      {Key? key,
      required this.title,
      this.btnWith = 130,
      this.btnHeight = 50,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: btnWith,
      height: btnHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
      ),
    );
  }
}
