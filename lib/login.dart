import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final username = "Username";

  final password = "Password";

  final signIn = "Sign in";

  AnimationController animationController;
  Animation<double> animation;
  Animation<double> delayedAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 1), vsync: this);

    animation = Tween<double>(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.fastOutSlowIn, parent: animationController));

    delayedAnimation = Tween<double>(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
            parent: animationController));
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * deviceWidth, 0.0, 0.0),
                    child: Container(
                      child: Column(
                        children: [
                          platform(
                              TextField(
                                decoration: InputDecoration(hintText: username),
                              ),
                              CupertinoTextField(
                                placeholder: username,
                              )),
                          SizedBox(
                            width: 12.0,
                            height: 12.0,
                          ),
                          platform(
                              TextField(
                                decoration: InputDecoration(hintText: password),
                              ),
                              CupertinoTextField(
                                placeholder: password,
                              )),
                          SizedBox(
                            width: 20.0,
                            height: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        delayedAnimation.value * deviceWidth, 0.0, 0.0),
                    child: platform(
                        RaisedButton(
                          child: Text(signIn),
                          color: Colors.pink,
                          textColor: Colors.white,
                          onPressed: () {},
                        ),
                        CupertinoButton.filled(
                          child: Text(signIn),
                          onPressed: () {},
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget platform(Widget android, Widget iOS) {
    if (Platform.isIOS) {
      return iOS;
    } else {
      return android;
    }
  }
}
