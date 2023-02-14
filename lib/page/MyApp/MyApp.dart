import 'package:flutter/material.dart';
import 'package:cyrs_app/page/Home/Home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const App(),
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        splashColor:Colors.transparent,//点击时的高亮效果设置为透明
        highlightColor:Colors.transparent,//长按时的扩散效果设置为透明
      ),
    );
  }
}



class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // 控制Listview滚动
  static final GlobalKey<HomeState> appKey = GlobalKey();

  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Home(key: appKey),
    const Text(
      'my',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 0:
          appKey.currentState!.homeKey.currentState!.listController.animateTo(
            0.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
          );
          break;
        case 1:
          break;
      }
      _selectedIndex = index;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: '我',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        elevation: 6,
      ),
    );
  }
}
