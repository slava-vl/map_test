import 'dart:ui';

import 'package:flutter/material.dart';

class TopPanelBlur extends StatelessWidget {
  const TopPanelBlur({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Positioned(
      top: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.padding.top,
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
