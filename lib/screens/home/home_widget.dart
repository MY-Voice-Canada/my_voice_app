import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_voice_app/main.dart';
import 'package:my_voice_app/models/background_image.dart';
import 'package:my_voice_app/models/channel.dart';
import 'package:my_voice_app/models/user.dart';
import 'package:my_voice_app/models/video.dart';
import 'package:my_voice_app/screens/home/get_involved.dart';
import 'package:my_voice_app/screens/home/homepage.dart';
import 'package:my_voice_app/screens/home/just_ask.dart';
import 'package:my_voice_app/screens/home/read.dart';
import 'package:my_voice_app/screens/home/watch.dart';
import 'package:my_voice_app/screens/upper/appbar.dart';
import 'package:my_voice_app/services/wp.dart';
import 'package:my_voice_app/services/yt.dart';
import 'package:provider/provider.dart';

class MVHome extends StatefulWidget {
  @override
  _MVHomeState createState() => _MVHomeState();
}

class _MVHomeState extends State<MVHome> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _initChannel();
    _pageController = PageController();
  }

  _initChannel() async {
    Channel channel =
        await MVYT.instance.fetchChannel(channelId: "UC9szM33a4gomsN0KT7rr6Ag");
    Map<String, List<Video>> playlists = {};
    await MVYT.instance
        .fetchVideos(playlistId: "PLnpXzeyF9i1Aab_h91tFnblETtqfIhFin")
        .then((value) => playlists["Race Against Racism"] = value);
    await MVYT.instance
        .fetchVideos(playlistId: "PLnpXzeyF9i1Cbgw5qc1XeIfKNWhlCxN04")
        .then((value) => playlists["Candid Convos"] = value);
    await MVYT.instance
        .fetchVideos(playlistId: "PLnpXzeyF9i1CUsSK2JjmLjxG0hBSn_WuC")
        .then((value) => playlists["The MY Voice Show"] = value);
    await MVYT.instance
        .fetchVideos(playlistId: "PLnpXzeyF9i1BQCGig_5tnRUryxKMPUOBj")
        .then((value) => playlists["Connecting The World"] = value);

    if (mounted) Provider.of<MVP>(context, listen: false).channel = channel;
    if (mounted) Provider.of<MVP>(context, listen: false).playlists = playlists;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavChange(int i) {
    setState(() {
      _currentIndex = i;

      _pageController.animateToPage(i,
          duration: Duration(milliseconds: 500), curve: Curves.easeOut);
    });
  }

  void changePage(int i) {
    _pageController.animateToPage(i,
        duration: Duration(milliseconds: 200), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    final MVUser? user = Provider.of<MVUser?>(context);

    return user == null
        ? SizedBox.shrink()
        : FutureBuilder<MVWPContent>(
            future: MVWP.getContent(),
            builder: (context, snapshot) => MVBackground(
              child: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: getMVAppBar(context),
                  bottomNavigationBar: BottomNavigationBar(
                    onTap: _onBottomNavChange,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Theme.of(context).primaryColor,
                    selectedIconTheme: IconThemeData(color: Colors.white),
                    selectedItemColor: Colors.white,
                    currentIndex: _currentIndex,
                    items: [
                      BottomNavigationBarItem(
                          backgroundColor: HexColor("FFBF3B"),
                          icon: Icon(
                            Icons.home,
                          ),
                          label: "Home"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.menu_book_rounded,
                          ),
                          label: "Read"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.ondemand_video_rounded,
                          ),
                          label: "Watch"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.textsms_rounded,
                          ),
                          label: "Ask"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.calendar_today_rounded,
                          ),
                          label: "Join"),
                    ],
                  ),
                  body: PageView(
                    controller: _pageController,
                    onPageChanged: (i) {
                      setState(() => _currentIndex = i);
                    },
                    children: [
                      HomePage(
                        snapshot: snapshot,
                        changePage: changePage,
                      ),
                      ReadPage(
                        snapshot: snapshot,
                      ),
                      WatchPage(),
                      JAPage(
                        snapshot: snapshot,
                      ),
                      GIPage(
                        snapshot: snapshot,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
