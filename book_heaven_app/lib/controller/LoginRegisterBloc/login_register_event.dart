abstract class LoginRegisterEvent {}

class LoginButtonNavigateEvent extends LoginRegisterEvent {}

class RegisterButtonNavigateEvent extends LoginRegisterEvent {}

class LoginWithDataButtonNavigateEvent extends LoginRegisterEvent {
  final Map<String, dynamic> userCredential;
  LoginWithDataButtonNavigateEvent({required this.userCredential});
}

class RegisterWithDataButtonNavigateEvent extends LoginRegisterEvent {
  final Map<String, dynamic> userCredential;
  RegisterWithDataButtonNavigateEvent({required this.userCredential});
}

class LogoutButtonNavigateEvent extends LoginRegisterEvent {}

/// **Password Visibility Event**
class OnPasswordVisibilityEvent extends LoginRegisterEvent {}

/// **Dropdown Selection Event**
class OnDropdownSelectionEvent extends LoginRegisterEvent {
  final String selectedValue;
  OnDropdownSelectionEvent({required this.selectedValue});
}

/// **Radio Selection Event**
class OnRadioSelectionEvent extends LoginRegisterEvent {
  final String selectedValue;
  OnRadioSelectionEvent({required this.selectedValue});
}

/// **Checkbox Selection Event**
class OnCheckboxSelectionEvent extends LoginRegisterEvent {
  final bool isChecked;
  OnCheckboxSelectionEvent({required this.isChecked});
}
