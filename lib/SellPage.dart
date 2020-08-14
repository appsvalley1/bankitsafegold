import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellPage extends StatefulWidget {
  @override
  State createState() => new SellState();
}

class SellState extends State<SellPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool showProgress = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Column(children: [
              Align(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.rupeeSign,
                      size: 25,
                    ),
                    Text(
                      "4,500/gram",
                      style: TextStyle(fontSize: 25),
                    )
                  ],
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                alignment: Alignment.center,
              ),
              Align(
                child: Row(
                  children: [
                    Text(
                      "Current Selling Price",
                      style: TextStyle(fontSize: 21),
                    )
                  ],
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                alignment: Alignment.center,
              ),
            ]),
            elevation: 10,
          ),
        ),
        DefaultTabController(
          length: 2,
          child: SizedBox(
            height: 400.0,
            child: Container(
              color: const Color(0xff0A3F6F),
              child: Column(
                children: <Widget>[
                  TabBar(
                    labelColor: Colors.white,
                    labelStyle: TextStyle(fontSize: 18),
                    tabs: <Widget>[
                      Tab(
                        text: "Sell in Amount",
                      ),
                      Tab(
                        text: "Sell in Grams",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              new Form(
                                  key: _formKey,
                                  child: Theme(
                                    data: new ThemeData(
                                        brightness: Brightness.light,
                                        primarySwatch: Colors.deepOrange,
                                        inputDecorationTheme:
                                            new InputDecorationTheme(
                                                labelStyle: new TextStyle(
                                                    color: Colors.black))),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 0, 40, 0),
                                      child: new Column(
                                        children: <Widget>[
                                          new TextFormField(
                                              textInputAction:
                                                  TextInputAction.next,
                                              controller: emailController,
                                              validator: (value) {
                                                bool emailValid = RegExp(
                                                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                                    .hasMatch(value);
                                                if (value.isEmpty ||
                                                    !emailValid) {
                                                  return 'Enter Amount ';
                                                }
                                                return null;
                                              },
                                              decoration: new InputDecoration(
                                                  labelText: "Enter Amount "),
                                              keyboardType:
                                                  TextInputType.emailAddress),
                                          new TextFormField(
                                              textInputAction:
                                                  TextInputAction.done,
                                              obscureText: true,
                                              controller: passwordController,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Value in grams *';
                                                }
                                                return null;
                                              },
                                              decoration: new InputDecoration(
                                                  labelText:
                                                      "Value in grams *"),
                                              keyboardType: TextInputType.text),
                                          new Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 40, 0, 0)),
                                          MaterialButton(
                                            minWidth: 250,
                                            height: 50,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        20),
                                                side: BorderSide(
                                                    color: const Color(
                                                        0xff0A3F6F))),
                                            color: const Color(0xff0A3F6F),
                                            textColor: Colors.white,
                                            child: new Text(
                                              "Sell Now",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            splashColor: Colors.orange,
                                            onPressed: () {
                                              // Validate returns true if the form is valid, otherwise false.
                                              if (_formKey.currentState
                                                  .validate()) {
                                                setState(() {
                                                  showProgress = true;

                                                  /*  registerUser().then((value) {
                                                setState(() {
                                                  showProgress = false;
                                                });
                                                // Run extra code here
                                                if (value.TransactionStatus ==
                                                    1) {
                                                  saveReferralCode(
                                                      value.user.ReferralCode);
                                                  saveUserID("userid",
                                                      value.user.UserId);

                                                  saveUserRole(
                                                      "UserRole",
                                                      value.user.UserRole
                                                          );
                                                  saveuserKYC("userKYC",
                                                      value.user.userKYC);
                                                  saveBankDetails(
                                                      "bankDetailsStatus",
                                                      value.user
                                                          .bankDetailsStatus);
                                                  Fluttertoast.showToast(
                                                      msg: value
                                                          .TransactionMesage,
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIos: 1,
                                                      backgroundColor:
                                                          Colors.green,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);

                                                  Route route = MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPageTwo());
                                                  Navigator.pushReplacement(
                                                      context, route);
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg: value
                                                          .TransactionMesage,
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIos: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              }
                                              );*/
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              new Form(
                                  key: _formKey,
                                  child: Theme(
                                    data: new ThemeData(
                                        brightness: Brightness.light,
                                        primarySwatch: Colors.deepOrange,
                                        inputDecorationTheme:
                                        new InputDecorationTheme(
                                            labelStyle: new TextStyle(
                                                color: Colors.black))),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 0, 40, 0),
                                      child: new Column(
                                        children: <Widget>[
                                          new TextFormField(
                                              textInputAction:
                                              TextInputAction.next,
                                              controller: emailController,
                                              validator: (value) {
                                                bool emailValid = RegExp(
                                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                                    .hasMatch(value);
                                                if (value.isEmpty ||
                                                    !emailValid) {
                                                  return 'Enter grams  ';
                                                }
                                                return null;
                                              },
                                              decoration: new InputDecoration(
                                                  labelText: "Enter grams  "),
                                              keyboardType:
                                              TextInputType.emailAddress),
                                          new TextFormField(
                                              textInputAction:
                                              TextInputAction.done,
                                              obscureText: true,
                                              controller: passwordController,
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return 'Value in Rs  *';
                                                }
                                                return null;
                                              },
                                              decoration: new InputDecoration(
                                                  labelText:
                                                  "Value in Rs  *"),
                                              keyboardType: TextInputType.text),
                                          new Padding(
                                              padding:
                                              const EdgeInsets.fromLTRB(
                                                  0, 40, 0, 0)),
                                          MaterialButton(
                                            minWidth: 250,
                                            height: 50,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                new BorderRadius.circular(
                                                    20),
                                                side: BorderSide(
                                                    color: const Color(
                                                        0xff0A3F6F))),
                                            color: const Color(0xff0A3F6F),
                                            textColor: Colors.white,
                                            child: new Text(
                                              "Sell Now",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            splashColor: Colors.orange,
                                            onPressed: () {
                                              // Validate returns true if the form is valid, otherwise false.
                                              if (_formKey.currentState
                                                  .validate()) {
                                                setState(() {
                                                  showProgress = true;

                                                  /*  registerUser().then((value) {
                                                setState(() {
                                                  showProgress = false;
                                                });
                                                // Run extra code here
                                                if (value.TransactionStatus ==
                                                    1) {
                                                  saveReferralCode(
                                                      value.user.ReferralCode);
                                                  saveUserID("userid",
                                                      value.user.UserId);

                                                  saveUserRole(
                                                      "UserRole",
                                                      value.user.UserRole
                                                          );
                                                  saveuserKYC("userKYC",
                                                      value.user.userKYC);
                                                  saveBankDetails(
                                                      "bankDetailsStatus",
                                                      value.user
                                                          .bankDetailsStatus);
                                                  Fluttertoast.showToast(
                                                      msg: value
                                                          .TransactionMesage,
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIos: 1,
                                                      backgroundColor:
                                                          Colors.green,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);

                                                  Route route = MaterialPageRoute(
                                                      builder: (context) =>
                                                          MainPageTwo());
                                                  Navigator.pushReplacement(
                                                      context, route);
                                                } else {
                                                  Fluttertoast.showToast(
                                                      msg: value
                                                          .TransactionMesage,
                                                      toastLength:
                                                          Toast.LENGTH_SHORT,
                                                      gravity:
                                                          ToastGravity.BOTTOM,
                                                      timeInSecForIos: 1,
                                                      backgroundColor:
                                                          Colors.red,
                                                      textColor: Colors.white,
                                                      fontSize: 16.0);
                                                }
                                              }
                                              );*/
                                                });
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
