import 'package:cyrs_app/page/Music/Music.dart';
import 'package:flutter/material.dart';

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
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Music(),
    Text(
      'my',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
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
            icon: Icon(Icons.music_note_outlined),
            activeIcon: Icon(Icons.music_note),
            label: '音乐',
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
