import 'package:flutter/material.dart';
import 'package:graduation/controllers/google_controller.dart';
import 'package:graduation/models/post_model.dart';
import 'package:graduation/widget/posts/comment_screen.dart';
import 'package:graduation/widget/drawer.dart';
import 'package:share/share.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatefulWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isFavorite = false;
  int favoriteCount = 0;

  @override
  Widget build(BuildContext context) {
    DateTime postTime = DateTime.parse(widget.post.time);
    String timeAgo = timeago.format(postTime);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(children: [
        Row(children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(widget.post.profileImage),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.post.userName,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(timeAgo,
                    style: const TextStyle(fontSize: 15, color: Colors.grey)),
              ],
            ),
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.post.description != null)
              Text(
                widget.post.description!,
                style: const TextStyle(fontSize: 17, color: Colors.black),
              ),
            const SizedBox(height: 10),
            Image.network(
              widget.post.postImages ??
                  'https://play-lh.googleusercontent.com/Ia18pn57Va9bLaPBnBFi5dK3-hhMoNTyvRnlTtuT6RfE2-dYDoqsC-poWtXVnibwax7m',
              width: double.infinity,
              fit: BoxFit.fill,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.network(
                  'https://play-lh.googleusercontent.com/Ia18pn57Va9bLaPBnBFi5dK3-hhMoNTyvRnlTtuT6RfE2-dYDoqsC-poWtXVnibwax7m',
                  width: double.infinity,
                  fit: BoxFit.fill,
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    if (isFavorite) {
                      favoriteCount++;
                    } else {
                      favoriteCount--;
                    }
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.pinkAccent : Colors.grey,
                ),
                label: Text(favoriteCount.toString(),
                    style: const TextStyle(color: Colors.grey)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white.withOpacity(0.5);
                      }
                      return Colors.transparent;
                    },
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  showCommentsDialog(
                    context,
                    widget.post.comments,
                    (Comment comment) {
                      setState(
                        () {
                          widget.post.comments.add(comment);
                        },
                      );
                    },
                    "${firstName.text} ${lastName.text}",
                    UserController.user?.photoURL ??
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Google_Photos_icon_%282020%29.svg/640px-Google_Photos_icon_%282020%29.svg.png",
                  );
                },
                icon: const Icon(
                  Icons.chat_bubble_outline_outlined,
                  color: Colors.grey,
                ),
                label: Text(
                  '${widget.post.comments.length}', // Update to show actual count
                  style: const TextStyle(color: Colors.grey),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white.withOpacity(0.5);
                      }
                      return Colors.transparent;
                    },
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  final post = widget.post;
                  final shareContent =
                      'Check out this post by ${post.userName}:\n\n${post.description}\n\n${post.postImages ?? ''}';
                  Share.share(shareContent);
                },
                icon: const Icon(
                  Icons.share_outlined,
                  color: Colors.grey,
                ),
                label: const Text(
                  "Share",
                  style: TextStyle(color: Colors.grey),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.white.withOpacity(0.5);
                      }
                      return Colors.transparent;
                    },
                  ),
                ),
              ),
            ]),
          ],
        ),
      ]),
    );
  }
}
