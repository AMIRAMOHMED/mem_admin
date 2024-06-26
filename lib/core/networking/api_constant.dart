class ApiConstants {
  static const String apiBaseURL = 'https://mem-backend-a9s1.onrender.com/';
  static const String loginEndpoint = 'auth/signin/password';
  static const String vaildateToken = "auth/validate";
  static const String refreshToken = "auth/refresh";
  static const String creatMeeting = "meetings/new";
  static const String getAllMeetings = "meetings/all";
  static const String deleteMeeting = "meetings/";
  static const String setFireBaseId = "user/firebase-id";
  static const String creatNotifications = "notifications/new";
  static const String getAllNotifications = "notifications/all";
  static const String deleteNotifications = "notifications/";
  static const String getAllUser = "user/all";
  static const String creatGroup = "groups/new";
  static const String getAllGroup = "groups/all";
  static const String deleteGroup = "groups/";
  static const String getAllMessage = "groups/";

  //exercises
  static const String getAllExercises = "exercises/all";
  static const String createExercise = "exercises/new";
  static const String deleteExercise = "exercises/";
  static const String updateExercise = "exercises/";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
