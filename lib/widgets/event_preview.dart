import 'package:flutter/material.dart';
import 'package:greenbay_web/functions/date_time.dart';
import 'package:greenbay_web/widgets/text.dart';

class EventPreview extends StatelessWidget {

  const EventPreview({
    super.key,
    required this.event,
  });

  final Map<String, dynamic> event;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(
            text: event['title'],
          ),
          const SizedBox(height: 4),

          SubHeading(
            fontSize: 12,
            text: event['description'],
          ),

          const SizedBox(height: 8),

          RegularText(
            text:"${formatDateIntoWords(event['date'])}, ${event['location']}",
            color: Colors.green,
          ),
          const SizedBox(height: 8),
          
        ],
      ),
    );
  }
}
