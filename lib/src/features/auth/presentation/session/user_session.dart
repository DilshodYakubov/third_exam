class UserSession {
  UserSession._();
  static String? email;

  static void setEmail(String value) => email = value;
  static void clear() => email = null;
}
