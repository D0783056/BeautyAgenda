import 'package:beauty_agenda/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'forgetpasswd.dart';
import 'homepage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  LoginUserState createState() => LoginUserState();
}

class LoginUserState extends State {

  String email;
  String password;
  bool visible = false;
  int ii;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future getUserId() async {
    String email = emailController.text;

    var url = 'http://140.134.26.187/BeautyAgenda/getTest.php';
    var data = {'email': email};

    var response =  await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);

    if (response.statusCode == 200) {
      ii = int.parse(message['id']);
      print('login $ii');
    }
  }

  Future userLogin() async{

    // Showing CircularProgressIndicator.
    setState(() {
      visible = true ;
    });

    // Getting value from Controller
    String email = emailController.text;
    String password = passwordController.text;

    // SERVER LOGIN API URL
    var url = 'http://140.134.26.187/BeautyAgenda/login.php';

    // Store all data with Param Name.
    var data = {'email': email, 'password' : password};

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if(message == 'Login Success!') {
      await getUserId();
      setState(() {
        visible = false;
      });
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
                      MaterialPageRoute(builder: (context) => HomePage(ii))
                  );
                },
              ),
            ],
          );
        },
      );
    } else{
      setState(() {
        visible = false;
      });
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
                  padding: EdgeInsets.only(left: 25, top: 20.0, bottom: 15.0),
                  child: Text(
                    "登入",
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
                        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
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
                            bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
                            if (value.isEmpty) {
                              return 'Email Address is required';
                            } else if(emailValid == false) {
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
                        margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(Radius.circular(10.0))),
                            contentPadding: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 25.0),
                            prefixIcon: Icon(Icons.lock),
                            labelText: "密碼",
                            labelStyle: TextStyle(
                              fontFamily: 'GFSDidot',
                              fontSize: 30.0,
                              color: const Color(0xFF818181),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
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
                      Row(
                        children: <Widget>[
                          SizedBox(width: 25,),
                          GestureDetector(
                            onTap: () {
                              print("Tapped a Container");
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: Container(
                                width: 320,
                                padding: EdgeInsets.only(left: 120, bottom: 20.0),
                                child: Text(
                                  "尚未註冊?",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontFamily: 'GFSDidot',
                                    color: const Color(0xFF818181),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.only(left: 15),
                        height: 60.0,
                        width: 200.0,
                        child: RaisedButton(
                          color: const Color(0xFFFFD0D1),
                          child: Text(
                            "下一步",
                            style: TextStyle(fontFamily: 'GFSDidot',fontSize: 30.0, color: Colors.white),
                          ),
                          onPressed: () {
                            print("Tapped a Container");
                            if (!formkey.currentState.validate()) {
                              return;
                            }
                            formkey.currentState.save();
                            userLogin();
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
                padding: EdgeInsets.only(top: 70.0, left: 90),
                child: Text(
                  "Beauty & Health",
                  style: TextStyle(
                    fontFamily: 'GFSDidot',
                    fontSize: 25.0,
                    color: const Color(0xFF818181),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 100),
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
