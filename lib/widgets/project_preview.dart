import 'package:flutter/material.dart';
import 'package:greenbay_web/functions/date_time.dart';
import 'package:greenbay_web/widgets/text.dart';

class ProjectPreview extends StatelessWidget {

  const ProjectPreview({
    super.key,
    required this.project,
  });

  final Map<String, dynamic> project;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 3, 71, 96),
          borderRadius: BorderRadius.circular(12),
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 

            SizedBox(
              width: 150, 
              height: 150, 
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Transform.scale(
                    scale: 2.5,
                    child: CircularProgressIndicator(
                      value: 12 / 100,
                      strokeWidth: 8,
                      color: Colors.white,
                      backgroundColor: Colors.grey[300], 
                    ),
                  ),
                  Heading(
                    text: '${12.toStringAsFixed(0)}%',
                    color: Colors.white,
                  ),
                ],
              ),
            ),  

            Expanded(
              child: Column (
                children: [
                  Heading(
                    text: project['title'],
                    fontSize: 25,
                    color: Colors.white,
                    align: TextAlign.center,
                  ),

                  const SizedBox(height: 4),

                  SubHeading(
                    text: project['description'],
                    color: Colors.white,
                    align: TextAlign.center,
                  ),    

                  const SizedBox(height: 16),  

                  RegularText(
                    text: "Project ends on ${formatDateIntoWords(project['deadline'])}",
                    color: Colors.green,
                  ),


                  
                ],
              )

            ),

            IconButton(
              onPressed: () {}, 
              icon: const Icon(Icons.arrow_forward),
              iconSize: 15,
              color: Colors.white,
            ),
          ],
        ),
      )  
    );
  }
}
