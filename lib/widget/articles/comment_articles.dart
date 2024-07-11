import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/models/article_model.dart';

class CommentDialog extends StatefulWidget {
  final ArticleModel article;
  final Function(Comment comment) onCommentAdded;
  final String userName;
  final String userProfileImageUrl;

  const CommentDialog({
    Key? key,
    required this.article,
    required this.onCommentAdded,
    required this.userName,
    required this.userProfileImageUrl,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CommentDialogState createState() => _CommentDialogState();
}

class _CommentDialogState extends State<CommentDialog> {
  final TextEditingController _commentController = TextEditingController();
  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text('Comments', style: GoogleFonts.amaranth()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.article.comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        widget.article.comments[index].profileImageUrl),
                  ),
                  title: Text(
                    widget.article.comments[index].userName,
                    style: GoogleFonts.amaranth(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      widget.article.comments[index].text,
                      style: GoogleFonts.amaranth(
                          textStyle: const TextStyle(
                              fontSize: 16, color: Colors.black)),
                    ),
                  ),
                );
              },
            ),
          ),
          TextField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Add a comment',
              hintStyle: GoogleFonts.amaranth(),
              errorText: _errorText,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: GoogleFonts.amaranth(
              textStyle: const TextStyle(
                color: Color(0xff32aa90),
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (_commentController.text.isEmpty) {
              setState(() {
                _errorText = 'Comment cannot be empty';
              });
            } else {
              widget.onCommentAdded(
                Comment(
                  text: _commentController.text,
                  userName: widget.userName,
                  profileImageUrl: widget.userProfileImageUrl,
                ),
              );
              Navigator.of(context).pop();
            }
          },
          child: Text('Add',
              style: GoogleFonts.amaranth(
                textStyle: const TextStyle(
                  color: Color(0xff32aa90),
                ),
              )),
        ),
      ],
    );
  }
}
