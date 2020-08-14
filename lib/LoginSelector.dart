import 'package:safegoldapp/MainPageTwo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';




class LoginSelector extends StatefulWidget {
  @override
  State createState() => new LoginSelectorState();
}

class LoginSelectorState extends State<LoginSelector>
    with SingleTickerProviderStateMixin {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = "userid";
    String userID = prefs.getString(key) ?? "0";

    final UserRole="UserRole";

    int UserRol = prefs.getInt(UserRole) ?? 1;

    final privacykey = "privacy";
    int privacy = prefs.getInt(privacykey) ?? 0;
    if (privacy == 0) {
      Navigator.pushNamed(context, "/PrivacyPage");
    } else {
      if (userID != "0") {
        Route route = MaterialPageRoute(builder: (context) => MainPageTwo());
        Navigator.pushReplacement(context, route);


      } else {
        Navigator.pushNamed(context, "/login");
      }
    }

    // print('$userID'.length);
  }



  @override
  void initState() {
    super.initState();
    read();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

    );

  }
}
