import 'package:flutter/material.dart';
import 'package:greenbay_web/widgets/text.dart';

class CreateButton extends StatelessWidget {
  final String text;
  final Function () onPressed;

  const CreateButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.green,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        onPressed: onPressed,
        child: SubHeading(
          text: text,
          color: Colors.white,
          fontSize: 13,
        ),
      ),
    );
  }
}
