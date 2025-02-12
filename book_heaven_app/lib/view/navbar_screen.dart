import 'package:book_heaven_app/controller/NavbarBloc/navbar_bloc.dart';
import 'package:book_heaven_app/controller/NavbarBloc/navbar_event.dart';
import 'package:book_heaven_app/controller/NavbarBloc/navbar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarScreen extends StatelessWidget {
  final int selectedIndex;

  const NavbarScreen({super.key, this.selectedIndex = 0});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavbarBloc()
        ..add(ChangeBottomNavTapEvent(
            newIndex: selectedIndex)), // Set initial index
      child: const NavbarView(),
    );
  }
}

class NavbarView extends StatelessWidget {
  const NavbarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: (context, state) {
        if (state is ChangeBottomNavTapState) {
          return Scaffold(
            body: state.currentScreen,
            backgroundColor: Colors.white,
            bottomNavigationBar: SizedBox(
              height: 80,
              child: BottomNavigationBar(
                currentIndex: state.currentIndex,
                onTap: (index) {
                  context
                      .read<NavbarBloc>()
                      .add(ChangeBottomNavTapEvent(newIndex: index));
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
                selectedLabelStyle: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(74, 138, 196, 1),
                ),
                selectedItemColor: const Color.fromRGBO(74, 138, 196, 1),
                unselectedItemColor: const Color.fromRGBO(166, 166, 166, 1),
                unselectedLabelStyle: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(166, 166, 166, 1),
                ),
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icons/home.png")),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icons/category.png")),
                    label: "Category",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icons/cart.png")),
                    label: "Cart",
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/icons/profile.png")),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
