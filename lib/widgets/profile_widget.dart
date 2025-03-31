import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Durations.long1);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 100*(_controller.value - 1)),
          child: Opacity(
            opacity:_controller.value* _controller.value,
            child: child,
          ),
        );
      },
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/images/image.png"),
        radius: MediaQuery.sizeOf(context).width*0.3,
      ),
    );
  }
}
