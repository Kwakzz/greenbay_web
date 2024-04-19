import 'package:flutter/material.dart';
import 'package:greenbay_web/controllers/events.dart';
import 'package:greenbay_web/controllers/threads.dart';
import 'package:greenbay_web/pages/create_event.dart';
import 'package:greenbay_web/widgets/button.dart';
import 'package:greenbay_web/widgets/event_preview.dart';
import 'package:greenbay_web/widgets/navbar.dart';
import 'package:greenbay_web/widgets/text.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  EventsState createState() => EventsState();
}

class EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomepageNavbar(),
      body: Center( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CreateButton(
              text: "Create Event",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateEvent(),
                  ),
                );
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: getEvents(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: RegularText(
                        text: "Error fetching events",
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    List events = snapshot.data as List;

                    return ListView.builder(
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        Map <String, dynamic> event = events[index];
                        return EventPreview(
                          event: event,
                        );
                      },
                    );
                  }

                  return const Center(
                    child: RegularText(
                      text: "No events found",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
