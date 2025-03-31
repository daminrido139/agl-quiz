import 'package:agl_quiz/pages/about_page.dart';
import 'package:agl_quiz/pages/chat_page.dart';
import 'package:agl_quiz/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> pages = [
    AboutPage(),
    ChatScreen()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        NavigationRail( 
          minWidth: 100,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text("Home"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.chat_outlined),
              selectedIcon: Icon(Icons.chat),
              label: Text("Chat"),
            )
          ],
          selectedIndex: currentIndex,
          onDestinationSelected: (value) {
            setState(
              () {
                setState(() {
                  currentIndex = value;
                });
              },
            );
          },
        ),
        VerticalDivider(
          width: 1,
          thickness: 1,
          color: (Provider.of<ThemeProvider>(context).isDarkMode)?Colors.grey.shade700: Colors.grey.shade300,
        ),
        Expanded(
          child: IndexedStack(
            index: currentIndex,
            children: pages,
          ),
        ),
      ],
    ));
  }
}
