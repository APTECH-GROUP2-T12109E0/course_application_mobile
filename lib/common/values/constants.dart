class AppConstants{
  // static const String SERVER_API_URL = "http://192.168.1.12:8080/"; //http://{your_IPv4_IP}:8080/
  static const String SERVER_API_URL = "https://clicknlearn-api.kindbeach-1b081cd2.eastasia.azurecontainerapps.io/";
  static const String SERVER_UPLOADS = "${SERVER_API_URL}uploads/";
  static const String SERVER_USER_ITEM = "${SERVER_API_URL}auth/user/";
  static const String SERVER_COURSE_DETAIL = "${SERVER_API_URL}course";
  static const String STORAGE_DEVICE_OPEN_FIRST_TIME = 'device_first_open';
  static const String STORAGE_USER_PROFILE_KEY = 'user_profile_key';
  static const String STORAGE_USER_TOKEN_KEY = 'user_token_key';
  static const String STORAGE_USER_REFRESH_TOKEN_KEY = 'user_refresh_token_key';
}