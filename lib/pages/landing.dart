import 'package:flutter/material.dart';
import 'package:greenbay_web/widgets/display_image.dart';
import 'package:greenbay_web/widgets/navbar.dart';


class Landing extends StatelessWidget {

  const Landing({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomepageNavbar(),
      body: ListView(
        children: const [
          DisplayImage(),
        ],
      ),
    );
  }

}
