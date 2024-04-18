import 'package:flutter/material.dart';
import 'package:greenbay_web/controllers/threads.dart';
import 'package:greenbay_web/pages/forum.dart';
import 'package:greenbay_web/widgets/button.dart';
import 'package:greenbay_web/widgets/form_field.dart';
import 'package:greenbay_web/widgets/navbar.dart';
import 'package:greenbay_web/widgets/text.dart';

class CreateThread extends StatefulWidget {
  const CreateThread({super.key});

  @override
  CreateThreadState createState() => CreateThreadState();
}

class CreateThreadState extends State<CreateThread> {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarWithOnlyLogo(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const Heading(
                    text: "Create Thread",
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: titleController,
                    label: "Title",
                    hintText: "Enter the title of the thread",
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: authorController,
                    label: "Author",
                    hintText: "Id of the author",
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: descriptionController,
                    label: "Description",
                    hintText: "What is the thread about?",
                    maxLines: 8,
                  ),

                  const SizedBox(height: 16),

                  CreateButton(
                    text: "Create Thread",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {

                        Map<String, dynamic> response = await createThread(
                          titleController.text,
                          descriptionController.text,
                          authorController.text,
                        );

                        if (!mounted) return;

                        if (response['status']) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Forum(),
                            ),
                          );
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: RegularText(text: "Error creating project", color: Colors.white),
                              backgroundColor: Colors.black54,
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(16), 
                              elevation: 0,
                            ),
                          );
                        }


                        
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
