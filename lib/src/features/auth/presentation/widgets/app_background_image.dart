import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  const BackgroundImage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: .all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fon.png'),
            fit: .cover,
          ),
        ),
        child: child,
      ),
    );
  }
}
