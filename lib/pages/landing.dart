import 'package:flutter/material.dart';
import 'package:greenbay_web/widgets/display_image.dart';
import 'package:greenbay_web/widgets/navbar.dart';
import 'package:greenbay_web/widgets/text.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomepageNavbar(),
      body: ListView(
        children: [
          const DisplayImage(),
          const SizedBox(height: 30),
          _buildRowTextThenImage("Do you know the earth's ozone\nlayer is being depleted at\nan alarming rate?", 
           "The ozone layer is a thin layer of the Earth's atmosphere that absorbs most of the sun's ultraviolet (UV) radiation. It is located in the stratosphere, about 10 to 30 kilometers above the Earth. ",
          "assets/images/ozone.jpeg"),
          const SizedBox(height: 30),
          _buildRowImageThenText("Trees are the lungs of the earth", 
           "Trees are the lungs of the earth. They absorb carbon dioxide and other potentially harmful gasses, releasing oxygen in return. They are an integral part of the ecosystem and are essential for the survival of all living things.",
          "assets/images/trees.jpeg"),
          const SizedBox(height: 30),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 3, 71, 96)
    );
  }

}

Widget _buildRowTextThenImage(String header, String description, String imageUrl) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(
                text: header,
                fontSize: 25,
                color: Colors.green,
              ),
              const SizedBox(height: 8),
              RegularText(
                text: description,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      Flexible(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), 
          ),
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect( 
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              width: 400,
              height: 400,
              fit: BoxFit.cover, 
            ),
          ),
        ),
      ),
    ],
  );
}


Widget _buildRowImageThenText(String header, String description, String imageUrl) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Flexible(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), 
          ),
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect( 
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imageUrl,
              width: 400,
              height: 400,
              fit: BoxFit.cover,  
            ),
          ),
        ),
      ),
      Flexible(
        flex: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(
                text: header,
                fontSize: 25,
                color: Colors.green,
              ),
              const SizedBox(height: 8),
              RegularText(
                text: description,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      
    ],
  );
}
