abstract class LoginRegisterState {}

class LoginRegisterInitialState extends LoginRegisterState {}

class LoginRegisterActionState extends LoginRegisterState {}

class LoginButtonNavigateState extends LoginRegisterActionState {}

class RegisterButtonNavigateState extends LoginRegisterActionState {}

class LoginWithDataButtonNavigateState extends LoginRegisterActionState {}

class LoginRegisterWithDataButtonErrorState extends LoginRegisterActionState {
  final String error;
  LoginRegisterWithDataButtonErrorState({required this.error});
}

class LogoutButtonNavigateState extends LoginRegisterActionState {}

class PasswordVisibilityState extends LoginRegisterState {
  final bool isVisible;
  PasswordVisibilityState({required this.isVisible});
}

class DropdownSelectionState extends LoginRegisterState {
  final String selectedValue;
  DropdownSelectionState({required this.selectedValue});
}

class RadioSelectionState extends LoginRegisterState {
  final String selectedValue;
  RadioSelectionState({required this.selectedValue});
}

class CheckboxSelectionState extends LoginRegisterState {
  final bool isChecked;
  CheckboxSelectionState({required this.isChecked});
}
