import 'package:flutter/material.dart';
import 'package:musico/constants.dart';
import 'package:musico/screens/Home.dart';
import '../widgets/mywidgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Theme(
      data: ThemeData(
          primaryColor: myDarkColor,
          backgroundColor: myDarkColor,
          appBarTheme: AppBarTheme(backgroundColor: myDarkColor)),
      child: SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent.withOpacity(0.1),
            child: Text(
              "skip >",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) => Home()));
            },
          ),
          body: SingleChildScrollView(
            child: Container(
              height: height,
              color: myDarkColor.shade700,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Hi!",
                        style: TextStyle(
                          fontSize: 40,
                          color: txtColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    MyCustomText(
                      mtext:
                          "Sign up to start listening  to all\n your favorite artists",
                    ),
                    MyCustomTxtField(
                      inputType: "Username",
                      myOnChanged: () => {},
                    ),
                    MyCustomTxtField(
                      inputType: "Password",
                      myOnChanged: () => {},
                    ),
                    MyCustomTxtField(
                      inputType: "Confirm password",
                      myOnChanged: () => {},
                    ),
                    MyCustomTxtField(
                      inputType: "Email",
                      myOnChanged: () => {},
                    ),
                    MyCustomBtn(btnName: "Register", press: () {}),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "or continue with",
                            style: TextStyle(
                              fontSize: 18,
                              fontStyle: FontStyle.italic,
                              color: txtColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyCustomBtn2(
                              btnName: "Facebook",
                              btnColor: Colors.white,
                              press: () {}),
                          MyCustomBtn2(
                              btnName: "Google",
                              btnColor: Colors.white,
                              press: () {}),
                        ],
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
