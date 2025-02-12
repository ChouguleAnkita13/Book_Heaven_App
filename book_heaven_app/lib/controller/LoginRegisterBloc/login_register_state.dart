abstract class LoginRegisterState {}

class LoginRegisterInitialState extends LoginRegisterState {}
class LoginRegisterActionState extends  LoginRegisterState {}

class LoginButtonNavigateState extends LoginRegisterActionState {}

class RegisterButtonNavigateState extends LoginRegisterActionState {}

class LoginWithDataButtonNavigateState extends LoginRegisterActionState {}

class LoginRegisterWithDataButtonErrorState extends LoginRegisterActionState {
  final String error;
  LoginRegisterWithDataButtonErrorState({required this.error});
}

class LogoutButtonNavigateState extends LoginRegisterActionState {}

/// **Password Visibility State**
class PasswordVisibilityState extends LoginRegisterState {
  final bool isVisible;
  PasswordVisibilityState({required this.isVisible});
}

/// **Dropdown Selection State**
class DropdownSelectionState extends LoginRegisterState {
  final String selectedValue;
  DropdownSelectionState({required this.selectedValue});
}

/// **Radio Selection State**
class RadioSelectionState extends LoginRegisterState {
  final String selectedValue;
  RadioSelectionState({required this.selectedValue});
}

/// **Checkbox Selection State**
class CheckboxSelectionState extends LoginRegisterState {
  final bool isChecked;
  CheckboxSelectionState({required this.isChecked});
}
