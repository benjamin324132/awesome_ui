// @dart=2.9
import 'package:flutter/material.dart';

class SizeConfig {
  static double _defaultScreenWidth = 375;
  static double _defaultScreenHeight = 812;

  //parameters required for calculating SizeConfig
  final Size screenSize;
  final Orientation orientation;
  final Size designSize;

  //Scale Factor
  static double _widthMultiplier;
  static double _heightMultiplier;

  //actual dimensions of the screen
  static double _actualScreenWidth;
  static double _actualScreenHeight;

  //multiplying factors
  static double _widthMultiplyingFactor;
  static double _heightMultiplyingFactor;

  //orientation of the screen
  static Orientation _orientation;

  //default constructor
  SizeConfig.init({
    this.screenSize,
    this.orientation,
    this.designSize,
  }) {
    //so that we can access orientation in getInfo()
    _orientation = orientation;

    //Set the default width and height
    if (designSize != null) {
      _defaultScreenWidth = designSize.width;
      _defaultScreenHeight = designSize.height;
    }

    //initialising actual screen dimensions
    _actualScreenWidth = screenSize.shortestSide;
    _actualScreenHeight = screenSize.longestSide;

    if (orientation == Orientation.portrait) {
      //calculating multiplication factors
      _widthMultiplyingFactor = _actualScreenWidth / _defaultScreenWidth;
      _heightMultiplyingFactor = _actualScreenHeight / _defaultScreenHeight;

      //assigning scale Factors
      _widthMultiplier = _actualScreenWidth / 100;
      _heightMultiplier = _actualScreenHeight / 100;
    }

    //interchanging height and width for landscape
    else if (orientation == Orientation.landscape) {
      _heightMultiplyingFactor = _actualScreenWidth / _defaultScreenWidth;
      _widthMultiplyingFactor = _actualScreenHeight / _defaultScreenHeight;

      //assigning scale Factors
      _widthMultiplier = _actualScreenHeight / 100;
      _heightMultiplier = _actualScreenWidth / 100;
    }
  }

  ///Returns width of device
  ///
  ///in fraction as [double]
  ///UseCase
  ///[width = SizeConfig.widthMultiplier * 50]
  ///
  ///It assigns 50% of your screen [width]
  static double get widthMultiplier => _widthMultiplier;

  ///Returns width of device
  ///
  ///in fraction as [double]
  ///UseCase
  ///[height = SizeConfig.heightMultiplier * 50]
  ///
  ///It assigns 50% of your screen [height]
  static double get heightMultiplier => _heightMultiplier;

  ///Pass the width in pixels
  ///
  ///Returns responsive width as [double]
  static double setWidth(double width) => width * _widthMultiplyingFactor;

  ///Pass the height in pixels
  ///
  ///Returns responsive height as [double]
  static double setHeight(double height) => height * _heightMultiplyingFactor;

  ///Pass the font size in pixels
  ///
  ///Returns responsive size as [double]
  static double setSp(double size) {
    if (_orientation == Orientation.landscape) {
      return setHeight(size);
    }
    return setWidth(size);
  }

  ///Pass the Image size in pixels
  ///
  ///Returns responsive size as [double]
  static double setImageSize(double size) {
    if (_orientation == Orientation.landscape) {
      return setHeight(size);
    }
    return setWidth(size);
  }

  ///Get information about current screen layout
  ///
  ///Returns a Multi-line [String]
  static String getInfo() {
    return '''
    \n
    orientation: $_orientation
    default screen width: $_defaultScreenWidth
    default screen height: $_defaultScreenHeight
    actual screen width: $_actualScreenWidth
    actual screen height: $_actualScreenHeight
    width multiplying factor: $_widthMultiplyingFactor
    height multiplying factor: $_heightMultiplyingFactor
    ''';
  }
}

typedef SizeWidgetBuilder = Widget Function(BuildContext context);

class SizeConfiguration extends StatelessWidget {
  const SizeConfiguration({
    Key key,
    this.builder,
    this.designSize,
  }) : super(key: key);

  ///The size of device
  ///
  ///on which design are designed
  final Size designSize;

  //Widget Builder
  final SizeWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeConfig.init(
          screenSize: Size(constraints.maxWidth, constraints.maxHeight),
          orientation: orientation,
          designSize: designSize,
        );

        return Builder(builder: builder);
      });
    });
  }
}
