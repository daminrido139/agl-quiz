import 'package:flutter/material.dart';

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "About me: \n\n",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "Hi, I'm ",
              style: TextStyle(fontSize: 18),
            ),
            TextSpan(
              text: "Damin Rido",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            TextSpan(
              text:
                  ", a passionate developer eager to contribute to open-source projects. I'm currently preparing for ",
              style: TextStyle(fontSize: 18),
            ),
            TextSpan(
              text: "Google Summer of Code (GSoC) 2025",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            TextSpan(
              text:
                  " and interested in working on Automotive Grade Linux (AGL), specifically enhancing its speech recognition app.\n\n",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
