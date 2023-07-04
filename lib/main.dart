import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:device_preview/device_preview.dart';
import './screens/onboard.dart';
import 'pages/home.dart';
import './firebase/login.dart';
import 'dart:ui';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'My Anime App',
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/load.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _buttonOffsetAnimation;
  late Animation<Offset> _textOffsetAnimation;
  bool _isTextAnimated = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _buttonOffsetAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _textOffsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        setState(() {
          _isTextAnimated = true;
        });
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 4, 119),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/back.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.9,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 54, 4, 119),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SlideTransition(
                        position: _textOffsetAnimation,
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            'My Anime App',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 238, 0),
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'times new roman',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 46),
                      SlideTransition(
                        position: _textOffsetAnimation,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Lets start with my amazing app and watch your favourite animes',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: _isTextAnimated
                                  ? Color.fromARGB(255, 255, 255, 255)
                                  : Color.fromARGB(255, 255, 255, 255),
                              fontSize: 20,
                              fontFamily: 'arial',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      SlideTransition(
                        position: _textOffsetAnimation,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnimeScreen()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 129, 119, 119),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            textStyle: TextStyle(fontSize: 20.0),
                            minimumSize: Size(300.0, 60.0),
                          ),
                          child: Text(
                            'Join as a guest',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.normal,
                                fontSize: 22,
                                fontFamily: 'arial'),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SlideTransition(
                        position: _buttonOffsetAnimation,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 1, 1),
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 32.0),
                            textStyle: TextStyle(fontSize: 20.0),
                            minimumSize: Size(300.0, 60.0),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.normal,
                                fontSize: 22,
                                fontFamily: 'arial'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
