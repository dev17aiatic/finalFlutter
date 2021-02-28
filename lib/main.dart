import 'package:app1/view/favorites_page.dart';
import 'package:app1/view/login_page.dart';
import 'package:app1/view/news_page.dart';
import 'package:app1/view/register.dart';
import 'package:app1/view/verification.dart';
import 'package:app1/view/view_more.dart';
import 'package:flutter/material.dart';
import 'package:app1/util/firebaseController.dart' as firebaseAuth;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
  firebaseAuth.Initialing();
}

// clase principal
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/login':
            return MaterialPageRoute(builder: (context) => new LoginPage());
          case '/news':
            return MaterialPageRoute(builder: (context) => new NewsPage());
          case '/preview':
            return MaterialPageRoute(
                builder: (context) => new Preview(settings.arguments));
          case '/favorites':
            return MaterialPageRoute(builder: (context) => new Favorites());
          case '/register':
            return MaterialPageRoute(builder: (context) => new RegisterUser());
          case '/verification':
            return MaterialPageRoute(
                builder: (context) => new Verification_page());
          default:
            return null;
        }
      },
    );
  }
}
