import 'dart:developer';

import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/login_screen.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRegisterBloc = LoginRegisterBloc();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocListener<LoginRegisterBloc, LoginRegisterState>(
        bloc: loginRegisterBloc,
        listener: (context, state) {
          ///NAVIGATE TO LOGINSCREEN
          if (state is LoginButtonNavigateState) {
            log("In NAVIGATE TO LOGINSCREEN");
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          }

          ///NAVIGATE TO Register Screen
          else if (state is RegisterButtonNavigateState) {
            log("In NAVIGATE TO Register Screen");
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const RegisterScreen()));
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.only(top: 20, bottom: 15, right: 27, left: 27),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Skip",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(74, 138, 196, 1),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Image.asset("assets/images/onboard.png"),
              const SizedBox(
                height: 9,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.8,
                child: Text(
                  "Your Bookish Soulmate Awaits",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(18, 18, 18, 1),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.4,
                child: Text(
                  "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromRGBO(166, 166, 166, 1),
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      loginRegisterBloc.add(RegisterButtonNavigateEvent());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 30),
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(74, 138, 196, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "Register",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      loginRegisterBloc.add(LoginButtonNavigateEvent());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(229, 243, 255, 1),
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(74, 138, 196, 1),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
