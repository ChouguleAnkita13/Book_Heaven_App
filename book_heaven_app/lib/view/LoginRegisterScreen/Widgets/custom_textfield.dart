import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_bloc.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    required this.title,
    required this.textcontroller,
    required this.bloc,
  });
  final String title;
  final LoginRegisterBloc bloc;
  final TextEditingController textcontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(18, 18, 18, 1),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 49,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 250, 250, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            controller: textcontroller,
            obscureText: title != "Password" ? false : bloc.isPasswordVisible,
            cursorColor: const Color.fromRGBO(184, 184, 184, 1),
            decoration: InputDecoration(
                hintText: "Your ${title.toLowerCase()}",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(184, 184, 184, 1),
                ),
                suffixIcon: title != "Password"
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () {
                          bloc.add(OnPasswordVisibilityEvent());
                        },
                        child: Icon(
                          bloc.isPasswordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: const Color.fromRGBO(184, 184, 184, 1),
                          size: 24,
                        ),
                      ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                )),
          ),
        ),
      ],
    );
  }
}
