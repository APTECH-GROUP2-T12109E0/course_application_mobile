class AppConstants{
  // static const String SERVER_API_URL = "https://d034-139-5-108-170.ngrok-free.app/";
  // static const String SERVER_API_URL = "http://127.0.0.1:8001/";
  // static const String SERVER_API_URL = "http://localhost:8080/";
  static const String SERVER_API_URL = "http://192.168.1.28:8080/";
  // static const String SERVER_API_URL = "http://192.168.1.12:8080/";
  static const String SERVER_UPLOADS = "${SERVER_API_URL}uploads/";
  static const String SERVER_USER_ITEM = "${SERVER_API_URL}auth/user/";
  static const String SERVER_COURSE_DETAIL = "${SERVER_API_URL}course";
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = 'device_first_open';
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile_key';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token_key';
  static const String STORAGE_USER_REFRESH_TOKEN_KEY = 'user_refresh_token_key';
}