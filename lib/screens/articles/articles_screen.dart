import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation/controllers/google_controller.dart';
import 'package:graduation/models/article_model.dart';
import 'package:graduation/screens/articles/articles2_screen.dart';
import 'package:graduation/services/article_services.dart';
import 'package:graduation/widget/appbar.dart';
import 'package:graduation/widget/articles/comment_articles.dart';
import 'package:graduation/widget/drawer.dart';
import 'package:share/share.dart';
import 'package:dio/dio.dart';

class ArticleScreen extends StatefulWidget {
  const ArticleScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  Future<void> fetchArticles() async {
    ArticleServices articleServices = ArticleServices(Dio());
    List<ArticleModel> fetchedArticles = await articleServices.getArticles();
    setState(() {
      articles = fetchedArticles;
      isLoading = false;
    });
  }

  void addComment(int articleIndex, Comment comment) {
    setState(() {
      articles[articleIndex].comments.add(comment);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        icon: Icons.more_vert,
      ),
      drawer: const AllDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Text(
                          "Medical Articles",
                          style: GoogleFonts.ptSans(
                            textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff32AA90),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.grey,
                                      spreadRadius: -2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Image.network(
                                      articles[index].image,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          16, 8, 8, 8),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  Article2Screen(
                                                title: articles[index].title,
                                                image: articles[index].image,
                                                description:
                                                    articles[index].description,
                                                subTitles:
                                                    articles[index].subTitles,
                                                subDescriptions: articles[index]
                                                    .subDescriptions,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          articles[index].title,
                                          style: GoogleFonts.amaranth(
                                            textStyle: const TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          25, 0, 8, 16),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute<void>(
                                              builder: (BuildContext context) =>
                                                  Article2Screen(
                                                title: articles[index].title,
                                                image: articles[index].image,
                                                description:
                                                    articles[index].description,
                                                subTitles:
                                                    articles[index].subTitles,
                                                subDescriptions: articles[index]
                                                    .subDescriptions,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          articles[index].description,
                                          style: GoogleFonts.amaranth(
                                            textStyle: const TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff6D6666)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 22, right: 20),
                                          child: Text(
                                            "Today",
                                            style: GoogleFonts.amaranth(
                                              textStyle: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xff32AA90),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () async {
                                                    String data =
                                                        "title : ${articles[index].title}\n\ncontent : ${articles[index].description}";
                                                    Share.share(data);
                                                  },
                                                  icon:
                                                      const Icon(Icons.share)),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 16.0),
                                                child: Text(
                                                  '${articles[index].comments.length}',
                                                  style: GoogleFonts.amaranth(
                                                    textStyle: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize:
                                                        const Size(21, 21),
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    elevation: 0,
                                                  ),
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          CommentDialog(
                                                        article:
                                                            articles[index],
                                                        onCommentAdded:
                                                            (comment) {
                                                          addComment(
                                                              index, comment);
                                                        },
                                                        userName:
                                                            "${firstName.text} ${lastName.text}",
                                                        userProfileImageUrl:
                                                            UserController.user
                                                                    ?.photoURL ??
                                                                "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/Google_Photos_icon_%282020%29.svg/640px-Google_Photos_icon_%282020%29.svg.png", // use the user's profile image URL from the drawer
                                                      ),
                                                    );
                                                  },
                                                  child: const Icon(
                                                    Icons.mode_comment_outlined,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${articles[index].likes}',
                                                style: GoogleFonts.amaranth(
                                                  textStyle: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              IconButton(
                                                iconSize: 24,
                                                icon: Icon(
                                                  articles[index].isFavorite
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color:
                                                      articles[index].isFavorite
                                                          ? Colors.pinkAccent
                                                          : Colors.grey,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    articles[index].isFavorite =
                                                        !articles[index]
                                                            .isFavorite;
                                                    if (articles[index]
                                                        .isFavorite) {
                                                      articles[index].likes++;
                                                    } else {
                                                      articles[index].likes--;
                                                    }
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
