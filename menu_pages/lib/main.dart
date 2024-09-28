import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:menu_pages/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';

// Navigator Observer to listen for navigation events
class MyNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    // You can add your custom behavior here when popping routes
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(token: prefs.getString('token')));
}

class MyApp extends StatelessWidget {
  final String? token; // Specify the type as String?

  const MyApp({this.token, Key? key}) : super(key: key); // Add key to the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [MyNavigatorObserver()], // Add the navigator observer here
      home: (token != null && !JwtDecoder.isExpired(token!))
          ? Dashboard(token: token!)
          : const SignIn(),
    );
  }
}
