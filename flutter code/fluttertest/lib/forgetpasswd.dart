import 'register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// ignore: must_be_immutable
class ForgetPasswd extends StatelessWidget {
  String email;
  String password;
  final String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                color: const Color(0xFFFFD0D1),
                height: 150.0,
                width: 700.0,
                child: Column(
                  children: <Widget>[
                    Container(
                        width: 500.0,
                        padding: EdgeInsets.only(left: 48.0),
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
                        padding: EdgeInsets.only(right: 48.0),
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
                  padding: EdgeInsets.only(left: 20, top: 10.0, bottom: 15.0),
                  child: Text(
                    "忘記密碼",
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
                        margin: EdgeInsets.symmetric(vertical: 45, horizontal: 20),
                        child: TextFormField(
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
                      SizedBox(height: 90.0),
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        height: 60.0,
                        width: 220.0,
                        child: RaisedButton(
                          color: const Color(0xFFFFD0D1),
                          child: Text(
                            "發送驗證信",
                            style: TextStyle(fontFamily: 'GFSDidot',fontSize: 30.0, color: Colors.white),
                          ),
                          onPressed: () {
                            print("Tapped a Container");
                            if (!formkey.currentState.validate()) {
                              return;
                            }
                            formkey.currentState.save();
                            print(email);
                          },
                        ),
                      ),
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
