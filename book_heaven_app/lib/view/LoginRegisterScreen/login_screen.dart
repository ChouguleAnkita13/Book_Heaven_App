import 'dart:developer';

import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/bottom_line_button.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/custom_textfield.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/header.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/signwith_button.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/register_screen.dart';
import 'package:book_heaven_app/view/Widgets/custom_button.dart';
import 'package:book_heaven_app/view/Widgets/custom_snackbar.dart';
import 'package:book_heaven_app/view/navbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginRegisterBloc bloc = LoginRegisterBloc();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<LoginRegisterBloc, LoginRegisterState>(
          bloc: bloc,
          listenWhen: (current, previous) =>
              current is LoginRegisterActionState,
          buildWhen: (current, previous) =>
              current is! LoginRegisterActionState,
          listener: (context, state) {
            ///NAVIGATE TO HOMESCREEN
            if (state is LoginWithDataButtonNavigateState) {
              log("In LoginWithData to home");
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const NavbarScreen()));
            }

            ///NAVIGATE TO REGISTERSCREEN
            else if (state is RegisterButtonNavigateState) {
              log("In Login to Register");

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterScreen()));
            } else if (state is LoginRegisterWithDataButtonErrorState) {
              CustomSnackbar.customSnackbar(context, state.error);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 60, bottom: 24, right: 24, left: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Header(
                            title: "Welcome Back 👋",
                            content: "Sign to your account"),
                        CustomTextfield(
                            title: "Email",
                            bloc: bloc,
                            textcontroller: bloc.emailController),
                        CustomTextfield(
                            title: "Password",
                            bloc: bloc,
                            textcontroller: bloc.passwordController),
                        Row(
                          children: [
                            Checkbox(
                                value: bloc.isChecked,
                                splashRadius: 8,
                                activeColor:
                                    const Color.fromRGBO(74, 138, 196, 1),
                                onChanged: (val) {
                                  bloc.add(OnCheckboxSelectionEvent(
                                      isChecked: val!));
                                }),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Remember Me",
                              style: GoogleFonts.roboto(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromRGBO(74, 138, 196, 1),
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            ///ADDING LoginWithDataButtonNavigateEvent TO LOGINREGISTERBLOC

                            bloc.add(LoginWithDataButtonNavigateEvent(
                                userCredential: {
                                  "email": bloc.emailController.text,
                                  "password": bloc.passwordController.text,
                                }));
                          },
                          child: const CustomButton(
                            title: "Login",
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ///ADDING RegisterButtonNavigateEvent TO LOGINREGISTERBLOC
                            bloc.add(RegisterButtonNavigateEvent());
                          },
                          child: const Center(
                            child: BottomLineButton(
                                content: "Don’t have an account? ",
                                title: "Register"),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Or With",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(166, 166, 166, 1),
                            ),
                          ),
                        ),
                        const Column(
                          children: [
                            SignwithButton(
                              image: "assets/icons/google.png",
                              title: "Sign in with Google",
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SignwithButton(
                              image: "assets/icons/apple.png",
                              title: "Sign in with Apple",
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            );
          }),
    );
  }
}
