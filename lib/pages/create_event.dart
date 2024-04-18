import 'package:flutter/material.dart';
import 'package:greenbay_web/controllers/events.dart';
import 'package:greenbay_web/pages/events.dart';
import 'package:greenbay_web/widgets/button.dart';
import 'package:greenbay_web/widgets/form_field.dart';
import 'package:greenbay_web/widgets/navbar.dart';
import 'package:greenbay_web/widgets/text.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  CreateEventState createState() => CreateEventState();
}

class CreateEventState extends State<CreateEvent> {

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
  final TextEditingController locationController = TextEditingController();
  final TextEditingController organizerIDController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  DateTime? date;

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
                    text: "Create Event",
                  ),
                  const SizedBox(height: 16),

                  MyFormField(
                    controller: titleController,
                    label: "Title",
                    hintText: "Enter the title of the event",
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: organizerIDController,
                    label: "Organizer",
                    hintText: "Id of the organizer",
                  ),

                  MyFormField(
                    label: "Date", 
                    hintText: "When is the event happening?", 
                    controller: dateController,
                    onTap: () => selectDate(context, date, dateController),
                    keyboardType: TextInputType.datetime,
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: locationController,
                    label: "Location",
                    hintText: "Where is the event happening?",
                  ),

                  const SizedBox(height: 16),

                  MyFormField(
                    controller: descriptionController,
                    label: "Description",
                    hintText: "What is the event about?",
                    maxLines: 8,
                  ),

                  const SizedBox(height: 16),

                  CreateButton(
                    text: "Create Event",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {

                        Map<String, dynamic> response = await createEvent(
                          titleController.text,
                          descriptionController.text,
                          dateController.text,
                          locationController.text,
                          organizerIDController.text,
                        );

                        if (!mounted) return;

                        if (response['status']) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Events(),
                            ),
                          );
                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: RegularText(text: "Error creating event", color: Colors.white),
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
