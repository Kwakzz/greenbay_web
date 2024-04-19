// import 'package:flutter/material.dart';
// import 'package:greenbay_web/controllers/threads.dart';
// import 'package:greenbay_web/widgets/comment.dart';
// import 'package:greenbay_web/widgets/navbar.dart';
// import 'package:greenbay_web/widgets/text.dart';

// class ThreadView extends StatefulWidget {

//   final Map<String, dynamic> thread;

//   const ThreadView({
//     super.key,
//     required this.thread,
//   });

//   @override
//   ThreadViewState createState() => ThreadViewState();
// }

// class ThreadViewState extends State<ThreadView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const HomepageNavbar(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [

//             Heading(
//               text: widget.thread['title'],
//               fontSize: 24,
//             ),

//             const SizedBox(height: 8),

//             RegularText(
//               text: widget.thread['description'],
//             ),


            
//             Expanded(
//               child: FutureBuilder(
//                 future: getCommentsByThreadId(widget.thread['id']),
//                 builder: (context, snapshot) {

//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   if (snapshot.hasError) {
//                     return const Center(
//                       child: RegularText(
//                         text: "Error fetching comments ",
//                       ),
//                     );
//                   }

//                   if (snapshot.hasData) {
//                     List comments = snapshot.data as List;

//                     return ListView.builder(
//                       itemCount: comments.length,
//                       itemBuilder: (context, index) {

//                         Map<String, dynamic> comment = comments[index];

//                         return Comment(
//                           comment: comment,
//                         );
//                       },
//                     );
//                   }

//                   return const Center(
//                     child: RegularText(
//                       text: "No threads found",
//                     ),
//                   );
//                 },
//               ),
//             ),

//           ],
//         )
//       )
//     );
//   }
// }
