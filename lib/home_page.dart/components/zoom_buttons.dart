import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_page_model.dart';

class ZoomButtons extends StatelessWidget {
  const ZoomButtons(this._fabHeight, {Key? key}) : super(key: key);
  final double _fabHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20.0,
      bottom: _fabHeight,
      child: Column(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: ElevatedButton(
              onPressed: context.read<HomePageModel>().zoomUp,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.white.withOpacity(0.9),
              ),
              child: Icon(Icons.add, color: Colors.black.withOpacity(0.6)),
            ),
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: ElevatedButton(
              onPressed: context.read<HomePageModel>().zoomDown,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                backgroundColor: Colors.white.withOpacity(0.9),
              ),
              child: Icon(Icons.remove, color: Colors.black.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }
}
