import 'package:flutter/material.dart';
import 'package:greenbay_web/controllers/projects.dart';
import 'package:greenbay_web/pages/projects.dart';
import 'package:greenbay_web/widgets/button.dart';
import 'package:greenbay_web/widgets/form_field.dart';
import 'package:greenbay_web/widgets/navbar.dart';
import 'package:greenbay_web/widgets/text.dart';
import 'package:intl/intl.dart';


class CreateProject extends StatefulWidget {

  const CreateProject({super.key});

  @override
  CreateThreadState createState() => CreateThreadState();
}

class CreateThreadState extends State<CreateProject> {


  Future<void> selectDate(BuildContext context, DateTime? date, TextEditingController dateController) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime.now().add(const Duration(days: 365))
    );
    
    if (pickedDate != null && pickedDate != date) {
      setState(() {
        date = pickedDate;
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }

  }

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController ownerIDController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController();
  DateTime? deadline;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavbarWithOnlyLogo(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView( 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Heading(
                    text: "Create Project",
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: titleController,
                    label: "Title",
                    hintText: "Enter the title of the project",
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: ownerIDController,
                    label: "Owner",
                    hintText: "Id of the owner",
                  ),

                  MyFormField(
                    label: "Deadline", 
                    hintText: "When is the project due?", 
                    controller: deadlineController,
                    onTap: () => selectDate(context, deadline, deadlineController),
                    keyboardType: TextInputType.datetime,
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: descriptionController,
                    label: "Description",
                    hintText: "What is the project about?",
                    maxLines: 8,
                  ),

                  const SizedBox(height: 16),

                  CreateButton(
                    text: "Create Project",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {

                        Map<String, dynamic> response = await createProject(
                          titleController.text,
                          descriptionController.text,
                          deadlineController.text,
                          ownerIDController.text,
                        );

                        if (!mounted) return;

                        if (response['status']) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Projects(),
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
