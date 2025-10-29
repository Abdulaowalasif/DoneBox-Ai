class Endpoints {
  Endpoints._();

  //base url
  static const baseUrl = "https://2a0bf65a5ea0.ngrok-free.app/api/v1/";

  static const signup = "auth/signup/";
  static const login = "auth/login/";
  static const logout = "auth/logout/";

  static const verifyOtp = "auth/verify-otp/";
  static const resetPassword = "auth/reset-password/";
  static const sendOtp = "auth/send-otp/";

  static const refreshToken = "auth/refresh-token/";
  static const verifyToken = "auth/verify-token/";

  static const aiBaseUrl = "http://10.10.7.75:8000/";
  static const summerize = "summarize";
  static const explain = "explain";
  static const reply = "reply";
  static const reminder = "reminder";

  static const todaySummery = "tasks/today-progress-summary";
  static const tasks = "tasks/";
}
