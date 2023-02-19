import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/screens/home/article_preview.dart';
import 'package:my_voice_app/models/loading.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/services/wp.dart';
import 'package:my_voice_app/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:my_voice_app/models/continued_heading.dart';
import 'package:my_voice_app/models/magazine_card.dart';
import 'package:my_voice_app/models/video_preview.dart';
import 'package:my_voice_app/models/carousel.dart';
import 'package:collection/collection.dart';
import 'package:my_voice_app/utils/text.dart' as text_utils;
import 'package:my_voice_app/utils/html.dart' as html;

class HomePage extends StatefulWidget {
  final Function changePage;
  final snapshot;

  HomePage({required this.snapshot, required this.changePage});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MVUser user = Provider.of<MVUser?>(context)!;
    final videos = Provider.of<MVP>(context).channel?.videos ?? [];
    List<String> ayas = [
      "“And Allah would not punish them while they seek forgiveness”\n\n[Quran 8:33]",
      "“He created the heavens and earth in truth and formed you and perfected your forms; and to Him is the [final] destination”\n\n[Quran 64:3]",
      "“Do what is beautiful. Allah loves those who do what is beautiful”\n\n[Quran 2:195]",
      "“The truth is from your Lord, so do not be among the doubters”\n\n[Quran 3:60]",
      "“Allah does not burden a soul beyond that it can bear”\n\n[Quran 2:286]",
      "“So verily, with the hardship, there is relief. Verily, with the hardship, there is relief”\n\n[Quran 94:5-6]",
    ];

    if (widget.snapshot.hasData) {
      final MVWPContent data = widget.snapshot.data;
      final articles = data.allPosts;
      final justAsk = data.allJAs[2];

      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "السَّلَامُ عَلَيْكُمْ, ${Provider.of<MVP>(context).userName ?? "User"}!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Raleway',
                                  fontSize: text_utils.getadaptiveTextSize(
                                      context, 15))),
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                                color: Colors.blueAccent[100],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    (ayas.toList()..shuffle()).first,
                                    softWrap: true,
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(children: [
                        // Text("LATEST ISSUES",
                        //     style: TextStyle(
                        //       color: Colors.redAccent[400],
                        //       fontWeight: FontWeight.w600,
                        //       fontFamily: 'Raleway',
                        //       fontSize:
                        //           text_utils.getadaptiveTextSize(context, 15),
                        //     )),
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Transform.rotate(
                              angle: 0.15,
                              child: Image.asset(
                                "assets/images/magazine_volumes.png",
                                width:
                                    Provider.of<MVP>(context).screenWidth / 5,
                                height:
                                    Provider.of<MVP>(context).screenWidth / 5,
                              ),
                            )),
                        Text("For Youth, By Youth!",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Raleway',
                                fontStyle: FontStyle.italic))
                      ]),
                    )
                  ],
                )),
            SizedBox(height: 10),

            // Latest Issues
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: ContinuedHeading(
                      title: "Latest Issues For Purchase",
                      noViewAll: true,
                      redirect: () => widget.changePage(1),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: MagazineCard(
                            title: "The Dark Side: Nothing is as it Seems",
                            thumbnailImage:
                                "https://image.isu.pub/221225170921-391091463ef4d4e2a3fa46d8b3cac3be/jpg/page_1_thumb_large.jpg"),
                      ),
                      Expanded(
                        child: MagazineCard(
                            title: "The Other Side of the Coin",
                            thumbnailImage:
                                "https://image.isu.pub/220830022548-778fe168f61cbac9965ba447cbe874bd/jpg/page_1_thumb_large.jpg"),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 24),

            // Articles
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: ContinuedHeading(
                      accentColor: MYVoiceColors['pink'] as Color,
                      title: "Articles",
                      redirect: () => widget.changePage(1)),
                ),
                Container(
                  height: Provider.of<MVP>(context).screenWidth > 500
                      ? Provider.of<MVP>(context).screenHeightAppbarless / 2.2
                      : Provider.of<MVP>(context).screenHeightAppbarless / 1.8,
                  child: Carousel(
                    itemCount: 6,
                    carouselController: PageController(viewportFraction: 0.7),
                    carouselBuilder: (context, pageNumber) {
                      final article = articles[pageNumber];

                      return SizedBox(
                        width: Provider.of<MVP>(context).screenWidth / 2.2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ArticlePreview(
                            changeToReadPage: () => widget.changePage(1),
                            article: article,
                            categoryName: article['_embedded']['wp:term'][0][0]
                                ['name'],
                            title: article['title']['rendered']
                                .replaceAll(RegExp("&amp;"), '&')
                                .replaceAll(RegExp("&#038;"), '&')
                                .replaceAll(RegExp("&#39;"), '\''),
                            description: html.stripMarkup(
                                Provider.of<MVP>(context).headingRemover(
                                    article['content']['rendered'])),
                            thumbnailSrc: article['_embedded']
                                ['wp:featuredmedia'][0]['source_url'],
                            accentColor: MYVoiceColors['pink'] as Color,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Videos
            Container(
                color: Colors.black,
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: ContinuedHeading(
                          accentColor: MYVoiceColors['yellow'] as Color,
                          title: "Videos",
                          redirect: () => widget.changePage(2),
                          textColor: Colors.white,
                        )),
                    Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            child: VideoPreview(
                                title: videos[0].title,
                                channelTitle: videos[0].channelTitle,
                                videoThumbnailSrc: videos[0].thumbnailUrl)),
                        SizedBox(height: 24),
                        Container(
                          height: MediaQuery.of(context).size.width > 500
                              ? 400
                              : 300,
                          child: Carousel(
                              itemCount: 3,
                              carouselController:
                                  PageController(viewportFraction: 0.95),
                              carouselBuilder: (context, index) {
                                final vids = videos.skip(1).slices(2).toList();

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: 12, left: 12, bottom: 6),
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: VideoPreview(
                                          title: vids[index][0].title,
                                          channelTitle:
                                              vids[index][0].channelTitle,
                                          videoThumbnailSrc:
                                              vids[index][0].thumbnailUrl,
                                        ),
                                      ),
                                      SizedBox(width: 30),
                                      Expanded(
                                        child: VideoPreview(
                                          title: vids[index][1].title,
                                          channelTitle:
                                              vids[index][1].channelTitle,
                                          videoThumbnailSrc:
                                              vids[index][1].thumbnailUrl,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 25,
            ),
            // Just Ask
            Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    ContinuedHeading(
                      title: "Just Ask",
                      redirect: () => widget.changePage(3),
                      accentColor: MYVoiceColors['teal'] as Color,
                    ),
                    SizedBox(height: 12),
                    JustAskPreview(
                      title: justAsk['title']['rendered'],
                      meta:
                          "${justAsk["_embedded"]["wp:term"][0][0]["name"]} | ${justAsk["_embedded"]["author"][0]["name"]}",
                      description: html.stripMarkup(
                          justAsk['content']['rendered'].substring(0, 250) +
                              "..."),
                      thumbnail: justAsk["_embedded"]["wp:featuredmedia"][0]
                          ["source_url"],
                    ),
                  ],
                )),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Image.asset("assets/images/ask.png"), flex: 2),
                Expanded(flex: 1, child: SizedBox()),
                Expanded(
                  child: GestureDetector(
                    onTap: () => widget.changePage(3),
                    child: ClipPath(
                      clipper: QuestionClipPath(),
                      child: Container(
                        color: Colors.pinkAccent[200],
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 15, top: 15, bottom: 15, left: 80),
                          child: AutoSizeText(
                            "Have a question you need answered?",
                            maxLines: 2,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                fontSize:
                                    text_utils.getadaptiveTextSize(context, 20),
                                color: Color.fromRGBO(255, 255, 255, 1)),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ),
                  ),
                  flex: 6,
                ),
              ],
            )
          ],
        ),
      );
    } else
      return MVLoading(
          message: "Uh oh, something's gone wrong! Please restart the app...");
  }
}

class QuestionClipPath extends CustomClipper<Path> {
  Path getClip(Size size) {
    return Path()
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.25, size.height);
  }

  @override
  bool shouldReclip(CustomClipper<Path> path) => false;
}

class JustAskPreview extends StatelessWidget {
  final String thumbnail;
  final String title;
  final String description;
  final String meta;

  const JustAskPreview({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.description,
    required this.meta,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              this.thumbnail,
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.description,
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    this.meta,
                    softWrap: true,
                  ),
                )
              ],
            ))
      ],
    );
  }
}
