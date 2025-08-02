class HelperFunctions {
  static bool isValidEmail(String email) {
    RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}$");
    return emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  static String validatePassword(String password) {
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter.';
    }

    if (!RegExp(r'(?=.*\d)').hasMatch(password)) {
      return 'Password must contain at least one digit.';
    }

    if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(password)) {
      return 'Password must contain at least one special character (@\$!%*?&).';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    return '';
  }

  static bool isValidPhoneNumber(String phoneNumber) {
    RegExp phoneRegExp = RegExp(r'^[0-9]{10}$');
    return phoneRegExp.hasMatch(phoneNumber);
  }

  static bool isNotEmpty(String? text) {
    return text != null && text.isNotEmpty;
  }

  static bool isValidDate(String date) {
    RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    return dateRegExp.hasMatch(date);
  }

  static bool isValidTime(String time) {
    RegExp timeRegExp = RegExp(r'^(2[0-3]|[01]?[0-9]):([0-5]?[0-9])$');
    return timeRegExp.hasMatch(time);
  }

  static bool isValidCreditCard(String cardNumber) {
    int sum = 0;
    bool alternate = false;
    for (int i = cardNumber.length - 1; i >= 0; i--) {
      int n = int.parse(cardNumber[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) n -= 9;
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }
}
