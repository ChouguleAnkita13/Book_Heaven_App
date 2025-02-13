import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:book_heaven_app/view/CartScreen/cart_screen.dart';
import 'package:book_heaven_app/view/HomeScreen/home_screen.dart';
import 'package:book_heaven_app/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'navbar_event.dart';
import 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarInitialState()) {
    on<ChangeBottomNavTapEvent>(changeBottomNavTapEvent);
  }

  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  FutureOr<void> changeBottomNavTapEvent(
      ChangeBottomNavTapEvent event, Emitter<NavbarState> emit) {
    emit(ChangeBottomNavTapState(
        event.newIndex, _screens.elementAt(event.newIndex)));
  }
}
