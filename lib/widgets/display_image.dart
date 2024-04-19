import 'package:flutter/material.dart';
import 'package:greenbay_web/widgets/text.dart';


class DisplayImage extends StatelessWidget {


  final String displayImage = "assets/images/save_earth.jpeg";

  const DisplayImage({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          displayImage,
          width: double.infinity,
          height: 600,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 600,
          color: Colors.black.withOpacity(0.5),
        ),
        const Positioned(
          top: 120,
          left: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(
                text: "Save the earth\nwith others",
                fontSize: 40,
                weight: FontWeight.w700,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }

}