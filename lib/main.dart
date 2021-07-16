
import 'package:flutter/material.dart';
import 'package:responsive/forms/router/router.dart';
import 'package:responsive/forms/ui/home/ui/home_page.dart';
import 'package:responsive/forms/ui/register/main_register_screen.dart';
import 'package:responsive/helper/ShardPreferance_helper.dart';
import 'package:responsive/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpHelper.spHelper.initSharedPreference();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRouter.router.navKey,
      
      routes: {
        '/': (context) => Splash(),
        // 'home': (context) => HomePage(),
      },
      onGenerateRoute: (RouteSettings routeSettings) {
        String name = routeSettings.name;
        var arguments = routeSettings.arguments;
        switch (name) {
          case ('home'):
            return MaterialPageRoute(builder: (context) {
              return HomePage(arguments);
            });
          case ('register'):
            return MaterialPageRoute(builder: (context) {
              return FormUi();
            });
          default:
            return MaterialPageRoute(builder: (context) {
              return Scaffold(
                  backgroundColor: Colors.redAccent,
                  body: Center(child: Text('404 the page is not found')));
            });
        }
      },
    );
  }
}

