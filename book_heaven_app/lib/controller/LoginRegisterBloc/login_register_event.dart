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

class OnPasswordVisibilityEvent extends LoginRegisterEvent {}

class OnDropdownSelectionEvent extends LoginRegisterEvent {
  final String selectedValue;
  OnDropdownSelectionEvent({required this.selectedValue});
}

class OnRadioSelectionEvent extends LoginRegisterEvent {
  final String selectedValue;
  OnRadioSelectionEvent({required this.selectedValue});
}

class OnCheckboxSelectionEvent extends LoginRegisterEvent {
  final bool isChecked;
  OnCheckboxSelectionEvent({required this.isChecked});
}
