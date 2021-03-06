import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomBarDemo(),
    );
  }
}

class BottomBarDemo extends StatefulWidget {
  @override
  _BottomBarDemoState createState() => _BottomBarDemoState();
}

class _BottomBarDemoState extends State<BottomBarDemo> {

  int currentState = 0;
  PageController _pageController;
  TextStyle textStyle = TextStyle(fontSize: 30,fontStyle: FontStyle.italic);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo'),),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index){
            setState(() {
              currentState = index;
            });
          },
          children: [
            Container(
              color: Colors.blue,
              child: Center(
                child: Text('Welcome',style: textStyle,),
              ),
            ),
            Container(
              color: Colors.red,
              child: Center(
                child: Text('To',style: textStyle,),
              ),
            ),Container(
              color: Colors.green,
              child: Center(
                child: Text('The',style: textStyle,),
              ),
            ),
            Container(
              color: Colors.pink,
              child: Center(
                child: Text('Jungle',style: textStyle,),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        curve: Curves.easeIn,
          showElevation: true,
          selectedIndex: currentState,
          onItemSelected:(index){
          setState(() {
            currentState = index;
          });
          _pageController.jumpToPage(index);
          },
        items: [
          BottomNavyBarItem(icon: Icon(Icons.home),
              title: Text('Home'),
          inactiveColor: Colors.grey,
            activeColor: Colors.redAccent,
            textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Message'),
              inactiveColor: Colors.grey,
              activeColor: Colors.indigoAccent,
              textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.notifications),
              title: Text('Notification'),
              inactiveColor: Colors.grey,
              activeColor: Colors.green,
              textAlign: TextAlign.center
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              inactiveColor: Colors.grey,
              activeColor: Colors.blue,
              textAlign: TextAlign.center
          ),
        ],
      ),
    );
  }
}
















