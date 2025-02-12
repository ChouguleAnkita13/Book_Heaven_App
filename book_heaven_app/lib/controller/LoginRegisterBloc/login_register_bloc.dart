import 'dart:async';
import 'package:book_heaven_app/controller/FirebaseData/firebase_data.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:book_heaven_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  LoginRegisterBloc() : super(LoginRegisterInitialState()) {
    on<LoginButtonNavigateEvent>(loginButtonNavigateEvent);
    on<RegisterButtonNavigateEvent>(registerButtonNavigateEvent);
    on<LoginWithDataButtonNavigateEvent>(loginWithDataButtonNavigateEvent);
    on<RegisterWithDataButtonNavigateEvent>(
        registerWithDataButtonNavigateEvent);
    on<LogoutButtonNavigateEvent>(logoutButtonNavigateEvent);

    on<OnPasswordVisibilityEvent>(onPasswordVisibilityEvent);
    on<OnDropdownSelectionEvent>(onDropdownSelectionEvent);
    on<OnRadioSelectionEvent>(onRadioSelectionEvent);
    on<OnCheckboxSelectionEvent>(onCheckboxSelectionEvent);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool isPasswordVisible = true;
  String selectedDropdownValue = "";
  String selectedGender = "";
  bool isChecked = false;

  FutureOr<void> loginButtonNavigateEvent(
      LoginButtonNavigateEvent event, Emitter<LoginRegisterState> emit) {
    emit(LoginButtonNavigateState());
  }

  FutureOr<void> registerButtonNavigateEvent(
      RegisterButtonNavigateEvent event, Emitter<LoginRegisterState> emit) {
    emit(RegisterButtonNavigateState());
  }

  FutureOr<void> loginWithDataButtonNavigateEvent(
      LoginWithDataButtonNavigateEvent event,
      Emitter<LoginRegisterState> emit) async {
    if (event.userCredential["email"].trim()! != "" &&
        event.userCredential["password"].trim() != "") {
      String res = await FirebaseData.signUserAccount(event.userCredential);
      if (res == "true") {
        emit(LoginWithDataButtonNavigateState());
      } else {
        emit(LoginRegisterWithDataButtonErrorState(error: res));
      }
    } else {
      emit(LoginRegisterWithDataButtonErrorState(
          error: "Please Enter Email And Password"));
    }
  }

  FutureOr<void> registerWithDataButtonNavigateEvent(
      RegisterWithDataButtonNavigateEvent event,
      Emitter<LoginRegisterState> emit) async {
    if (event.userCredential["email"].trim()! != "" &&
        event.userCredential["password"].trim() != "" &&
        event.userCredential["gender"].trim() != "") {
      String res = await FirebaseData.createUserAccount(event.userCredential);
      if (res == "true") {
        emit(LoginButtonNavigateState());
      } else {
        emit(LoginRegisterWithDataButtonErrorState(error: res));
      }
    } else {
      emit(LoginRegisterWithDataButtonErrorState(
          error: "Please Enter Email, Password And Select Gender"));
    }
  }

  FutureOr<void> logoutButtonNavigateEvent(
      LogoutButtonNavigateEvent event, Emitter<LoginRegisterState> emit) async {
    await FirebaseData.logoutFromFirebase();
    emit(LogoutButtonNavigateState());
  }

  /// **Password Visibility Toggle**
  FutureOr<void> onPasswordVisibilityEvent(
      OnPasswordVisibilityEvent event, Emitter<LoginRegisterState> emit) {
    isPasswordVisible = !isPasswordVisible;
    emit(PasswordVisibilityState(isVisible: isPasswordVisible));
  }

  /// **Dropdown Selection**
  FutureOr<void> onDropdownSelectionEvent(
      OnDropdownSelectionEvent event, Emitter<LoginRegisterState> emit) {
    selectedDropdownValue = event.selectedValue;
    emit(DropdownSelectionState(selectedValue: selectedDropdownValue));
  }

  /// **Radio Button Selection**
  FutureOr<void> onRadioSelectionEvent(
      OnRadioSelectionEvent event, Emitter<LoginRegisterState> emit) {
    selectedGender = event.selectedValue;
    emit(RadioSelectionState(selectedValue: selectedGender));
  }

  /// **Checkbox Selection**
  FutureOr<void> onCheckboxSelectionEvent(
      OnCheckboxSelectionEvent event, Emitter<LoginRegisterState> emit) {
    isChecked = event.isChecked;
    emit(CheckboxSelectionState(isChecked: isChecked));
  }
}
