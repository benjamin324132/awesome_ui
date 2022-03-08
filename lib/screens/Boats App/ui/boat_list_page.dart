// @dart=2.9
import 'package:awesome_ui/screens/Boats%20App/models/boat.dart';
import 'package:awesome_ui/screens/Boats%20App/ui/widgets/boat_card.dart';
import 'package:flutter/material.dart';

import 'boat_specs_page.dart';

class BoatListPage extends StatefulWidget {
  @override
  _BoatListPageState createState() => _BoatListPageState();
}

class _BoatListPageState extends State<BoatListPage> {
  PageController _pageController;
  ValueNotifier<double> _pageNotifier;
  ValueNotifier<bool> _hideAppBarNotifier;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .7);
    _pageController.addListener(_pageListener);
    _pageNotifier = ValueNotifier(0.0);
    _hideAppBarNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _pageNotifier.value = _pageController.page;
  }

  //------------------------------------
  // Open Specs Boat Page
  //------------------------------------
  void _openSpecsPage(BuildContext context, Boat boat) async {
    _hideAppBarNotifier.value = true;
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: BoatSpecsPage(boat: boat),
            );
          },
        ));
    _hideAppBarNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //-----------------------------------
          // Custom App Bar
          //-----------------------------------
          SafeArea(
            child: ValueListenableBuilder(
                valueListenable: _hideAppBarNotifier,
                builder: (context, value, _) {
                  return _AnimatedCustomAppBar(animate: value);
                }),
          ),
          const SizedBox(height: 20),
          //------------------------------------
          // Boat Page View
          //------------------------------------
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: Boat.listBoats.length,
                itemBuilder: (context, index) {
                  final boat = Boat.listBoats[index];
                  return ValueListenableBuilder(
                      valueListenable: _pageNotifier,
                      builder: (context, value, _) {
                        final factorChange = (value - index).abs();
                        return BoatCard(
                          boat: boat,
                          onTapSpec: () => _openSpecsPage(context, boat),
                          factorChange: factorChange,
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class _AnimatedCustomAppBar extends StatelessWidget {
  const _AnimatedCustomAppBar({
    Key key,
    this.animate,
  }) : super(key: key);

  final bool animate;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 600),
      transform: Matrix4.translationValues(0, animate ? -100 : 0, 0),
      child: AnimatedOpacity(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 600),
        opacity: animate ? 0 : 1,
        child: SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Boats",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                  color: Colors.grey[800],
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
