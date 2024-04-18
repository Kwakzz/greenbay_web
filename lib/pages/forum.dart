import 'package:flutter/material.dart';
import 'package:greenbay_web/controllers/threads.dart';
import 'package:greenbay_web/pages/create_thread.dart';
import 'package:greenbay_web/widgets/button.dart';
import 'package:greenbay_web/widgets/navbar.dart';
import 'package:greenbay_web/widgets/text.dart';
import 'package:greenbay_web/widgets/thread_preview.dart';

class Forum extends StatefulWidget {

  const Forum({super.key});

  @override
  ForumState createState() => ForumState();
}

class ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomepageNavbar(),
      body: Center( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CreateButton(
              text: "Create Thread",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateThread(),
                  ),
                );
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: getThreads(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: RegularText(
                        text: "Error fetching threads",
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    List threads = snapshot.data as List;

                    return ListView.builder(
                      itemCount: threads.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> thread = threads[index];

                        return ThreadPreview(
                          thread: thread,
                        );
                      },
                    );
                  }

                  return const Center(
                    child: RegularText(
                      text: "No threads found",
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
