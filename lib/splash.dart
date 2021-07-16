import 'package:flutter/material.dart';
import 'package:responsive/forms/ui/home/ui/home_page.dart';
import 'package:responsive/forms/ui/register/main_register_screen.dart';
import 'package:responsive/helper/ShardPreferance_helper.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      if (SpHelper.spHelper.getUser() != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomePage("");
      }));
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return FormUi();
      }));
    }

  }
}
