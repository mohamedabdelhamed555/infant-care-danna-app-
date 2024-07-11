import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final List<String> videoURLs = [
    "https://www.youtube.com/watch?v=CXWzqbe1i9c",
    "https://www.youtube.com/watch?v=vYvPepGJLUA",
    "https://www.youtube.com/watch?v=0GfOv7XvKYM",
    "https://www.youtube.com/watch?v=se00vkpziuU",
    "https://www.youtube.com/watch?v=vYvPepGJLUA",
    "https://www.youtube.com/watch?v=0GfOv7XvKYM",
  ];
  late List<YoutubePlayerController> _controllers;

  @override
  void initState() {
    _controllers = List.generate(
      videoURLs.length,
      (index) => YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURLs[index])!,
        flags: const YoutubePlayerFlags(autoPlay: false),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Videos......",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff32AA90),
      ),
      body: ListView.builder(
        itemCount: videoURLs.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: YoutubePlayer(
                      controller: _controllers[index],
                      showVideoProgressIndicator: true,
                      onReady: () => debugPrint('Ready'),
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: const ProgressBarColors(
                            playedColor: Colors.grey,
                            handleColor: Colors.red,
                          ),
                        ),
                        const PlaybackSpeedButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
