import 'package:flutter/material.dart';
import 'package:map_test/home_page.dart/components/zoom_buttons.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'components/bottom_slide_pannel.dart';
import 'components/map_widget.dart';
import 'components/my_position_button.dart';
import 'components/search_panel.dart';
import 'components/top_panel_blur.dart';
import 'home_page_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => HomePageModel(),
      child: const HomePage(),
    );
  }

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  final double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: const MapWidget(),
            panelBuilder: (sc) => BottomSlidePannel(sc),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
            onPanelSlide: (double pos) => setState(() {
              _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
            }),
          ),
          const SearchPanel(),
          MyPositionButton(_fabHeight),
          const TopPanelBlur(),
          ZoomButtons(_fabHeight)
        ],
      ),
    );
  }
}
