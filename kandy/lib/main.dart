import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:kandy/page/BANGLA.dart';
import 'package:kandy/page/BOLLYWOOD.dart';
import 'package:kandy/page/ENGLISH.dart';
import 'package:kandy/login/services/authentication.dart';
import 'package:kandy/page/HINDI_DUBBED.dart';
import 'package:kandy/page/SOUTH.dart';
import 'package:kandy/page/others.dart';

import 'homescreen/splashscreen.dart';
import 'login/pages/root_page.dart';
import 'login/services/authentication.dart';

void main() => runApp(Akdom1st());

class Akdom1st extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new SplashScreen(),
        routes: <String, WidgetBuilder>{
          // '/MyHomePage': (BuildContext context) => MyHomePage(),
          '/RootPage': (BuildContext context) => new RootPage(auth: new Auth()),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.auth, this.userId, this.logoutCallback, this.title})
      : super(key: key);

  final String title;
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            ///////////////////////////////////////////////////////////////////////

            HINDI_DUBBED(),
            ENGLISH(),
            BOLLYWOOD(),
            SOUTH(),
            BANGLA(),
            OTHERS(),

            Scaffold(
                backgroundColor: Colors.black,
                body: Center(
                    child: FlatButton.icon(
                        color: Colors.transparent,
                        onPressed: signOut,
                        icon: Icon(
                          Icons.power_settings_new,
                          color: Colors.redAccent[700],
                        ),
                        label: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                        )))),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.black,
        containerHeight: 50.0,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.redAccent[700],
              inactiveColor: Colors.grey,
              title: Text('HINDI DUBBED'),
              icon: Icon(Icons.local_movies)),
          BottomNavyBarItem(
              activeColor: Colors.redAccent[700],
              inactiveColor: Colors.grey,
              title: Text('ENGLISH'),
              icon: Icon(Icons.movie)),
          BottomNavyBarItem(
              activeColor: Colors.redAccent[700],
              inactiveColor: Colors.grey,
              title: Text('BOLLYWOOD'),
              icon: Icon(Icons.movie_filter)),
          BottomNavyBarItem(
              activeColor: Colors.redAccent[700],
              inactiveColor: Colors.grey,
              title: Text('SOUTH'),
              icon: Icon(Icons.ondemand_video)),
          BottomNavyBarItem(
              activeColor: Colors.redAccent[700],
              inactiveColor: Colors.grey,
              title: Text('BANGLA'),
              icon: Icon(Icons.music_video)),
        ],
      ),
    );
  }
}
