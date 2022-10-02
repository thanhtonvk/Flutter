import 'package:flutter/cupertino.dart';

class AnimatedWidget extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const AnimatedWidget({Key? key, required this.child, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        ),
        child: child,
      ),
    );
  }
}
