//  Created by Nicholas Eastmond on 10/5/22.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:polls/polls_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polls/screens/login/custon_page_route.dart';
import 'package:polls/screens/login/signup_page.dart';
import 'package:polls/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  int tabSelected = 0; // initially tab selected is poll feed

  @override
  Widget build(BuildContext context) {
    return PollsTheme(builder: (context, theme) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0, -0.25),
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    theme.primaryColor,
                    theme.secondaryHeaderColor,
                  ],
                ),
              ),
              child: Center(
                child: SizedBox(
                  height: 550,
                  child: AutofillGroup(
                    child: Column(
                      children: [
                        const Center(
                          child: Icon(
                            Icons.bar_chart_rounded,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        Center(
                          child: Text(
                            "Rolli Polli",
                            style: GoogleFonts.zillaSlab(
                              fontSize: 42.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 55,
                          width: 400,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(15, 0, 0, 0),
                                    blurRadius: 4,
                                    spreadRadius: 4,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset.fromDirection(pi / 2, 4))
                              ],
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: const [AutofillHints.email],
                                cursorColor: Colors.black,
                                style: GoogleFonts.zillaSlab(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                minLines: 1,
                                autocorrect: false,
                                controller: emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  enabled: true,
                                  contentPadding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 8.0,
                                    bottom: 8.0,
                                  ),
                                  labelStyle: GoogleFonts.zillaSlab(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                  ),
                                  filled: false,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: "Email",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 55,
                          width: 400,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(15, 0, 0, 0),
                                    blurRadius: 4,
                                    spreadRadius: 4,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset.fromDirection(pi / 2, 4))
                              ],
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: TextField(
                                onEditingComplete: () =>
                                    TextInput.finishAutofillContext(),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                autofillHints: const [AutofillHints.password],
                                cursorColor: Colors.black,
                                style: GoogleFonts.zillaSlab(
                                  fontSize: 17.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                minLines: 1,
                                autocorrect: false,
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  enabled: true,
                                  contentPadding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 8.0,
                                    bottom: 8.0,
                                  ),
                                  labelStyle: GoogleFonts.zillaSlab(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                  ),
                                  filled: false,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  labelText: "Password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.never,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 55,
                          width: 400,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(20, 0, 0, 0),
                                    blurRadius: 4,
                                    spreadRadius: 4,
                                    blurStyle: BlurStyle.normal,
                                    offset: Offset.fromDirection(pi / 2, 4))
                              ],
                              color: theme.secondaryHeaderColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.zillaSlab(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              try {
                                await signIn(emailController.text,
                                    passwordController.text);
                              } catch (e) {
                                var snackBar = SnackBar(
                                    backgroundColor: theme.primaryColor,
                                    content: Text(
                                      '$e',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.zillaSlab(
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  const Spacer(),
                  Text(
                    "No account yet?",
                    style: GoogleFonts.zillaSlab(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(CustomPageRoute(const SignUpPage()));
                    },
                    child: Text(
                      "Sign Up!",
                      style: GoogleFonts.zillaSlab(
                        fontSize: 17.5,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
