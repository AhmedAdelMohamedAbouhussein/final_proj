class AppValidator {
  AppValidator._();

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return "Phone number is required";
    }

    // Allows optional + at start and 10–15 digits
    final RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');

    if (!phoneRegex.hasMatch(phone)) {
      return "Invalid phone number";
    }

    return null;
  }
}
