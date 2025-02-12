import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDropdown extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.title,
    required this.items,
    required this.bloc,
  });

  final String title;
  final List<String> items;
  final LoginRegisterBloc bloc;

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
        Container(
          height: 49,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(250, 250, 250, 1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: bloc.selectedDropdownValue,
              hint: Text(
                "Select ",
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(184, 184, 184, 1),
                ),
              ),
              icon: const Icon(Icons.keyboard_arrow_down,
                  color: Color.fromRGBO(184, 184, 184, 1)),
              isExpanded: true,
              onChanged: (String? newValue) {
                bloc.selectedDropdownValue = newValue!;
                bloc.add(OnDropdownSelectionEvent(selectedValue: newValue));
              },
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(18, 18, 18, 1),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
