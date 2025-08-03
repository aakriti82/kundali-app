bool isValidEmail(String email) {
  return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
}

bool isStrongPassword(String password) {
  return password.length >= 6;
}
