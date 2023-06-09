//  Created by Nicholas Eastmond on 10/5/22.

import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:polls/polls_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polls/services/auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  int tabSelected = 0; // initially tab selected is poll feed

  @override
  Widget build(BuildContext context) {
    return PollsTheme(
      builder: (context, theme) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
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
            child: Stack(
              children: [
                const Positioned(
                  top: 50,
                  left: 20,
                  child: BackButton(
                    color: Colors.white,
                  ),
                ),
                Center(
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
                              "Sign Up",
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
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.emailAddress,
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
                          const SizedBox(height: 20),
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
                                  autofillHints: const [AutofillHints.password],
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.zillaSlab(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  minLines: 1,
                                  autocorrect: false,
                                  controller: confirmPasswordController,
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
                                    labelText: "Confirm Password",
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
                            width: 450,
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
                                "Sign Up",
                                style: GoogleFonts.zillaSlab(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                try {
                                  await signUp(
                                    emailController.text,
                                    passwordController.text,
                                  ).then((value) {
                                    Navigator.pop(context);
                                  });
                                } catch (e) {
                                  var snackBar =
                                      SnackBar(content: Text('Error: $e'));
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
                Positioned(
                  bottom: 35,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(height: 1.5, shadows: []),
                        children: <TextSpan>[
                          TextSpan(
                            text: "By signing up, you agree to our  ",
                            style: GoogleFonts.zillaSlab(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          TextSpan(
                            text: "Terms",
                            recognizer: TapGestureRecognizer()..onTap = (() {}),
                            style: GoogleFonts.zillaSlab(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: theme.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ", ",
                            style: GoogleFonts.zillaSlab(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          TextSpan(
                            text: "Privacy Policy",
                            recognizer: TapGestureRecognizer()..onTap = (() {}),
                            style: GoogleFonts.zillaSlab(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: theme.primaryColor,
                            ),
                          ),
                          TextSpan(
                            text: ", and ",
                            style: GoogleFonts.zillaSlab(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          TextSpan(
                            text: "Community Guidelines",
                            recognizer: TapGestureRecognizer()..onTap = (() {}),
                            style: GoogleFonts.zillaSlab(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: theme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
