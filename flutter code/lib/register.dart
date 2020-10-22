import 'package:beauty_agenda/login.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class RegisterPage extends StatefulWidget {
  RegisterUserState createState() => RegisterUserState();
}

class RegisterUserState extends State {
  String name;
  String email;
  String password;
  String passwordcheck;
  bool visible = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordcheckController = TextEditingController();

  final String regexEmail =
      "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future userRegistration() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String passwordcheck = passwordcheckController.text;

    // SERVER API URL
    var url = 'http://140.134.26.187/BeautyAgenda/register.php';

    // Store all data with Param Name.
    var data = {
      'name': name,
      'email': email,
      'password': password,
      'passwordcheck': passwordcheck
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If Web call Success than Hide the CircularProgressIndicator.
    if (response.statusCode == 200) {
      setState(() {
        visible = false;
      });
    }

    if (message != "User Registered Successfully") {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: const Color(0xFFFFD0D1),
                height: 190.0,
                width: 700.0,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 500.0,
                        padding: EdgeInsets.only(top: 30.0, left: 48.0),
                        child: Text(
                          "Beauty",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: 'GFSDidot',
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        )),
                    Container(
                        width: 500.0,
                        padding: EdgeInsets.only(top: 10.0, right: 48.0),
                        child: Text(
                          "Agenda",
                          textAlign: TextAlign.right,
                          style: new TextStyle(
                            fontFamily: 'GFSDidot',
                            fontSize: 50.0,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 20, top: 20.0, bottom: 15.0),
                  child: Text(
                    "註冊",
                    style: TextStyle(
                      fontFamily: 'GFSDidot',
                      fontSize: 30.0,
                      color: const Color(0xFF818181),
                    ),
                  )),
              Container(
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: TextFormField(
                          controller: nameController,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            contentPadding:
                            EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                            prefixIcon: Icon(Icons.person),
                            labelText: "姓名",
                            labelStyle: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 30.0,
                              color: const Color(0xFF818181),
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'name is required';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String value) {
                            name = value;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            contentPadding:
                            EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 30.0,
                              color: const Color(0xFF818181),
                            ),
                          ),
                          validator: (String value) {
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);
                            if (value.isEmpty) {
                              return 'Email Address is required';
                            } else if (emailValid == false) {
                              return 'Please Enter Valid Email Address!';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String value) {
                            email = value;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20),
                        child: TextFormField(
                          autocorrect: true,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            contentPadding:
                            EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                            prefixIcon: Icon(Icons.lock),
                            labelText: "密碼",
                            labelStyle: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 30.0,
                              color: const Color(0xFF818181),
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'password is required';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String value) {
                            password = value;
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20),
                        child: TextFormField(
                          controller: passwordcheckController,
                          autocorrect: true,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                            contentPadding:
                            EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                            prefixIcon: Icon(Icons.lock),
                            labelText: "確認密碼",
                            labelStyle: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 30.0,
                              color: const Color(0xFF818181),
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'passwordcheck is required';
                            } else if (value != passwordController.text) {
                              return 'password and passwordcheck is not equal';
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String value) {
                            passwordcheck = value;
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print("Tapped a Container");
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            width: 500,
                            padding: EdgeInsets.only(right: 22.0, bottom: 20.0),
                            child: Text(
                              "返回登入頁面",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'GFSDidot',
                                color: const Color(0xFF818181),
                              ),
                            )),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 60.0,
                        width: 200.0,
                        child: RaisedButton(
                          color: const Color(0xFFFFD0D1),
                          child: Text(
                            "下一步",
                            style:
                            TextStyle(fontSize: 30.0, color: Colors.white),
                          ),
                          onPressed: () {
                            if (!formkey.currentState.validate()) {
                              return;
                            } else {
                              formkey.currentState.save();
                              userRegistration();
                            }
                          },
                        ),
                      ),
                      Visibility(
                          visible: visible,
                          child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              child: CircularProgressIndicator()))
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 70.0, left: 105),
                child: Text(
                  "Beauty & Health ,",
                  style: TextStyle(
                    fontFamily: 'GFSDidot',
                    fontSize: 25.0,
                    color: const Color(0xFF818181),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 120),
                child: Text(
                  "Make your day .",
                  style: TextStyle(
                    fontFamily: 'GFSDidot',
                    fontSize: 25.0,
                    color: const Color(0xFF818181),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
