import 'package:flutter/material.dart';
import 'package:greenbay_web/controllers/projects.dart';
import 'package:greenbay_web/pages/create_project.dart';
import 'package:greenbay_web/widgets/button.dart';
import 'package:greenbay_web/widgets/navbar.dart';
import 'package:greenbay_web/widgets/project_preview.dart';
import 'package:greenbay_web/widgets/text.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  ProjectsState createState() => ProjectsState();
}

class ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomepageNavbar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CreateButton(
              text: "Create Project",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateProject(),
                  ),
                );
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: getProjects(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Center(
                      child: RegularText(
                        text: "Error fetching projects",
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    List projects = snapshot.data as List;

                    return ListView.builder(
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        Map <String, dynamic> project = projects[index];

                        return ProjectPreview (
                          project: project,
                        ); 
                      },
                    );
                  }

                  return const Center(
                    child: RegularText(
                      text: "No projects found",
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
