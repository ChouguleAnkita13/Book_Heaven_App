import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/custom_dropdown.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/custom_radiobutton.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/custom_textfield.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/Widgets/header.dart';
import 'package:book_heaven_app/view/LoginRegisterScreen/login_screen.dart';
import 'package:book_heaven_app/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_heaven_app/view/Widgets/custom_snackbar.dart';
import 'Widgets/bottom_line_button.dart';
import 'dart:developer';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginRegisterBloc bloc = LoginRegisterBloc();

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: BlocConsumer<LoginRegisterBloc, LoginRegisterState>(
        bloc: bloc,
        listenWhen: (current, previous) => current is LoginRegisterActionState,
        buildWhen: (current, previous) => current is! LoginRegisterActionState,
        listener: (context, state) {
          ///NAVIGATE TO LOGIN SCREEN
          if (state is LoginButtonNavigateState) {
            log("In Register to login");
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false,
            );
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
                    top: 20, bottom: 12, right: 24, left: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Header(title: "Register", content: "Create account"),
                    CustomTextfield(
                        title: "Name",
                        bloc: bloc,
                        textcontroller: bloc.usernameController),
                    CustomTextfield(
                        title: "Email",
                        bloc: bloc,
                        textcontroller: bloc.emailController),
                    CustomTextfield(
                        title: "Password",
                        bloc: bloc,
                        textcontroller: bloc.passwordController),

                    /// Dropdown for Language Selection
                    CustomDropdown(
                        title: "Language",
                        items: const [
                          "",
                          "English",
                          "Spanish",
                          "French",
                          "German"
                        ],
                        bloc: bloc),

                    /// Radio Buttons for Gender Selection
                    CustomRadioButton(
                      title: "Gender",
                      bloc: bloc,
                    ),

                    /// Register Button
                    GestureDetector(
                      onTap: () {
                        ///ADDING RegisterWithDataButtonNavigateEvent TO LOGINREGISTERBLOC
                        bloc.add(RegisterWithDataButtonNavigateEvent(
                            userCredential: {
                              "email": bloc.emailController.text,
                              "password": bloc.passwordController.text,
                              "username": bloc.usernameController.text,
                              "lang": bloc.selectedDropdownValue,
                              "gender": bloc.selectedGender
                            }));
                      },
                      child: const CustomButton(
                        title: "Register",
                      ),
                    ),

                    /// Login Redirection
                    GestureDetector(
                      onTap: () {
                        ///ADDING LoginButtonNavigateEvent TO LOGINREGISTERBLOC
                        bloc.add(LoginButtonNavigateEvent());
                      },
                      child: const Center(
                        child: BottomLineButton(
                            content: "Have an account? ", title: "Login"),
                      ),
                    ),

                    /// Terms and Privacy Policy
                    Column(
                      children: [
                        Center(
                          child: Text(
                            "By clicking Register, you agree to our",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(166, 166, 166, 1),
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Terms and Privacy Policy.",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(74, 138, 196, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
