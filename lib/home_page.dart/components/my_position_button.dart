import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';

class MyPositionButton extends StatelessWidget {
  const MyPositionButton(this._fabHeight, {Key? key}) : super(key: key);
  final double _fabHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20.0,
      bottom: _fabHeight,
      child: FloatingActionButton(
        onPressed: context.read<HomePageModel>().getCurrent,
        backgroundColor: Colors.white.withOpacity(0.9),
        child: Icon(
          Icons.gps_fixed,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
