import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:developer';

class CustomRadioButton extends StatelessWidget {
  final String title;
  final LoginRegisterBloc bloc;

  const CustomRadioButton({
    super.key,
    required this.title,
    required this.bloc,
  });

  // Default selection
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
        const SizedBox(height: 5),
        Row(
          children: [
            Radio<String>(
              value: "Male",
              groupValue: bloc.selectedGender,
              activeColor: const Color.fromRGBO(74, 138, 196, 1),
              onChanged: (value) {
                bloc.selectedGender = value!;
                bloc.add(OnRadioSelectionEvent(selectedValue: value));
                log(bloc.selectedGender);
              },
            ),
            Text(
              "Male",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(18, 18, 18, 1)),
            ),
            const SizedBox(width: 20),
            Radio<String>(
              value: "Female",
              groupValue: bloc.selectedGender,
              activeColor: const Color.fromRGBO(74, 138, 196, 1),
              onChanged: (value) {
                bloc.selectedGender = value!;
                bloc.add(OnRadioSelectionEvent(selectedValue: value));
                log(bloc.selectedGender);
              },
            ),
            Text(
              "Female",
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(18, 18, 18, 1)),
            ),
          ],
        ),
      ],
    );
  }
}
