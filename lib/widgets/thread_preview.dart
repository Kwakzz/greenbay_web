import 'package:flutter/material.dart';

import 'text.dart';

class ThreadPreview extends StatelessWidget {
  final Map<String, dynamic> thread;

  const ThreadPreview({
    super.key,
    required this.thread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16, left: 24, right: 24), 
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Heading(
            text: thread['title'],
            fontSize: 20,
            weight: FontWeight.bold,
          ),
          const SizedBox(height: 8),
          SubHeading(
            text: thread['description'],
            fontSize: 16,
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "https://cdn.pixabay.com/photo/2018/04/08/10/07/sustainability-3300869_640.jpg",
              height: 300,
              width: MediaQuery.of(context).size.width * 0.6,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                return const Text('😢');
              },
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              SizedBox(width: 16),
              Icon(Icons.comment),
              Text("456"), // Replace with actual comment count
            ],
          ),
        ],
      ),
    );
  }
}
