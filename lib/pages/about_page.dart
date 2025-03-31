import 'package:agl_quiz/providers/theme_provider.dart';
import 'package:agl_quiz/widgets/introduction_widget.dart';
import 'package:agl_quiz/widgets/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool showImage = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          "AGL GSOC Task",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(
              (Provider.of<ThemeProvider>(context).isDarkMode)
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
              size: 48,
            ),
          ),
          SizedBox(width: 50)
        ],
      ),
      body: Center(
        child: Row(
          children: [
            Spacer(),
            SizedBox.square(
              dimension: width * 0.25,
              child: showImage ? Center(child: ProfileWidget()) : null,
            ),
            SizedBox(width: 100),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IntroductionWidget(),
                SizedBox(height: 30),
                MaterialButton(
                  minWidth: 120,
                  height: 60,
                  onPressed: () {
                    setState(() {
                      showImage = !showImage;
                    });
                  },
                  color: Colors.green,
                  child: Text(
                    showImage ? "Hide" : "Show",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            )),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
