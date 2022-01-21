import 'package:awesome_ui/screens/BackPrompt/MyHomePage.dart';
import 'package:awesome_ui/screens/Bank%20Cards/bank_app.dart';
import 'package:awesome_ui/screens/Banking%20App/banking_app_screen.dart';
import 'package:awesome_ui/screens/Boats%20App/ui/boat_list_page.dart';
import 'package:awesome_ui/screens/Bottom%20Nav/bottom_nav_screen.dart';
import 'package:awesome_ui/screens/Clock/main.dart';
import 'package:awesome_ui/screens/DayAndNight/screens/login/login_screen.dart';
import 'package:awesome_ui/screens/FlappyBird/homepage.dart';
import 'package:awesome_ui/screens/Hezi%20App/henzi_app_screen.dart';
import 'package:awesome_ui/screens/Home%20Rental%20App/home_rental_app_screen.dart';
import 'package:awesome_ui/screens/JobsApp/jobs_app_screen.dart';
import 'package:awesome_ui/screens/Paint%20App/paint_app_screen.dart';
import 'package:awesome_ui/screens/Playstationcontroller/play_station_controller.dart';
import 'package:awesome_ui/screens/Poster/poster_screen.dart';
import 'package:awesome_ui/screens/Scaper/scraper_screen.dart';
import 'package:awesome_ui/screens/Signup/signup_screen.dart';
import 'package:awesome_ui/screens/SmartHome/smart_home_screen.dart';
import 'package:awesome_ui/screens/Sopitas/sopitas_screen.dart';
import 'package:awesome_ui/screens/SopitasV2/sopitas_screenV2.dart';
import 'package:awesome_ui/screens/Tetris/Tetris.dart';
import 'package:awesome_ui/screens/Workout%20App/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*void main() {
  runApp(MyApp());
}*/
void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Chooser(),
    );
  }
}

class Chooser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WorkOutScreen()));
                    },
                    child: Text("Workout app")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text("Signup")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HenziApp()));
                    },
                    child: Text("Henzi App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomAnimationNav()));
                    },
                    child: Text("Bottom Nav Animation")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => SmartHome()));
                    },
                    child: Text("Smart Home")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BankingApp()));
                    },
                    child: Text("Banking App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BoatListPage()));
                    },
                    child: Text("Boat App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeRentalApp()));
                    },
                    child: Text("Rental App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              MyHomePage(title: 'Flutter Demo Home Page')));
                    },
                    child: Text("MyHomePage")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SopitasScreen()));
                    },
                    child: Text("Sopitas")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SopitasScreen2()));
                    },
                    child: Text("Sopitas V2")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => BankCard()));
                    },
                    child: Text("Bank Cards")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DrawingBoard()));
                    },
                    child: Text("Drawing App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => JobsApp()));
                    },
                    child: Text("Jobs App")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PlayStationControllerScreen()));
                    },
                    child: Text("PS Controller")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ClockScreen()));
                    },
                    child: Text("Clock Screen")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Text("Day And Night")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FlappyBird()));
                    },
                    child: Text("Flappy Bird")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Tetris()));
                    },
                    child: Text("Tetris")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScraperScreen()));
                    },
                    child: Text("Scraper")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PosterScreen()));
                    },
                    child: Text("Poster")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
