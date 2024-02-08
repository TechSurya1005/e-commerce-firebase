class AppUrl {
  static const String baseUrl = "https://dummyjson.com";
  static var authEndPoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String register = "user/register";
  final String login = "/api/authaccount/login";
  final String products = "/products/1";
  // final String verifyOtp = "user/verifyLogin";
  // final String forgotPass = "user/forgot";
  // final String forgotVerify = "user/verifyForgot";
}
