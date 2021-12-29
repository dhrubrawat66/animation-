import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:four/widgets/non_rotating_button_widget.dart';
import 'package:four/widgets/rotating_button_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = "Icon Animation";
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      theme: ThemeData(primaryColor: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyApp.title),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            NonRotatingButtonWidget(
              icon: FontAwesomeIcons.gift,
              child: RotatingButtonWidget(icon: FontAwesomeIcons.gift),
            ),
            SizedBox(width: 10),
            NonRotatingButtonWidget(
              icon: FontAwesomeIcons.cocktail,
              child: RotatingButtonWidget(icon: FontAwesomeIcons.cocktail),
            ),
            SizedBox(width: 10),
            NonRotatingButtonWidget(
              icon: FontAwesomeIcons.heart,
              child: RotatingButtonWidget(icon: FontAwesomeIcons.heart),
            ),
            SizedBox(width: 10),
            NonRotatingButtonWidget(
              icon: FontAwesomeIcons.globe,
              child: RotatingButtonWidget(icon: FontAwesomeIcons.globe),
            ),
            SizedBox(width: 10),
            NonRotatingButtonWidget(
              icon: FontAwesomeIcons.graduationCap,
              child: RotatingButtonWidget(icon: FontAwesomeIcons.graduationCap),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
