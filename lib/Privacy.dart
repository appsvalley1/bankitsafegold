import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrivacyPage extends StatefulWidget {
  @override
  State createState() => new PrivacyPageState();
}

class PrivacyPageState extends State<PrivacyPage> {

  savePrivacyClicked(String dataKey, int dataValue) async {
    final prefs = await SharedPreferences.getInstance();
    final key = dataKey;
    final value = dataValue;
    prefs.setInt(key, value);
    print('saved $value');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(

        backgroundColor: Colors.white,
        body:

        Stack(
          children: <Widget>[
            SizedBox(

              child: Center(
                child: Column(


                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/safegold.png'),
                      width: 280,
                      height: 100,
                    ),
                    Text("Powered By"),
                    Image(
                      image: AssetImage('assets/bankit_logo.png'),
                      width: 280,
                      height: 100,
                    ),

                  ],
                ),
              ),height: 500,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,80),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[  Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20),
                      side: BorderSide(color: const Color(0xff0A3F6F))),
                  elevation: 10,
                  child: new MaterialButton(
                    minWidth: 330,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20),
                        side: BorderSide(color: const Color(0xff0A3F6F))),
                    color: const Color(0xff24293c),
                    textColor: Colors.white,
                    child: new Text(
                      "Start",
                      style: TextStyle(fontSize: 20),
                    ),
                    splashColor: Colors.red,
                    onPressed: () {
                      savePrivacyClicked(
                          "privacy",1);
                      Navigator.pushNamed(context, "/login");
                    },
                  ),
                ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text:
                      TextSpan(
                        text: 'Please review & accept our ',
                        style: TextStyle(fontSize: 14,color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                          TextSpan(text: ' and Terms of use', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.orange)),
                          TextSpan(
                              text: ' to continue',
                              style: TextStyle(color: Colors.black)),
                        ],
                      ),
                    ),
                  )],
              ),
            )
          ],
        ),
        );
  }
}
