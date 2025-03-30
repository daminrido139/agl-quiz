import 'package:agl_quiz/widgets/introduction_widget.dart';
import 'package:agl_quiz/widgets/profile_widget.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(flex:2,child: showImage?Center(child: ProfileWidget()):SizedBox.shrink()),
          MaterialButton(
            minWidth: 120,
            height: 60,
            onPressed: () {
              setState(() {
                showImage = !showImage;
              });
            },
            color: Colors.green.shade800,
            child: Text(showImage? "Hide":"Show", style: TextStyle(fontSize: 24),),
          ),
          SizedBox(height: 10),
          IntroductionWidget(),
          Spacer(),
        ],
      ),
    );
  }
}


