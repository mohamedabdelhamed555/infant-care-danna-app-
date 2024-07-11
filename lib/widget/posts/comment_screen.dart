// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/models/post_model.dart';

void showCommentsDialog(BuildContext context, List<Comment> comments,
    Function(Comment) addComment, String userName, String userProfileImageUrl) {
  final TextEditingController controller = TextEditingController();
  String? _errorText;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Comments'),
        content: Container(
          // Set a fixed height for the content
          height: 400, // Adjust this height according to your needs
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(comments[index].profileImageUrl),
                      ),
                      title: Text(
                        comments[index].userName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          comments[index].text,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: 'Add a comment',
                        hintStyle: GoogleFonts.amaranth(),
                        errorText: _errorText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel',
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                    color: Color(0xff32aa90),
                  ),
                )),
          ),
          TextButton(
            child: Text('Add',
                style: GoogleFonts.amaranth(
                  textStyle: const TextStyle(
                    color: Color(0xff32aa90),
                  ),
                )),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                Comment newComment = Comment(
                  text: controller.text,
                  userName: userName,
                  profileImageUrl: userProfileImageUrl,
                );
                addComment(newComment);
                Navigator.of(context).pop();
                showCommentsDialog(context, comments, addComment, userName,
                    userProfileImageUrl); // Reopen the dialog to update the comments list
              }
            },
          ),
        ],
      );
    },
  );
}
