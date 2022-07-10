class ApiConstants {
  static const parseUrl = "https://parseapi.back4app.com/classes/";
  static const parseAppID = "YOUR_PARSE_APPLICATION_ID";
  static const parseApiKey = "YOUR_PARSE_REST_API_KEY";

  static const task = "task";
  static const tasks = "tasks";
}

class EventConstants {
  static const int serverError = 3;
  static const int forbidden = 5;
  static const int requestSuccessful = 10;
  static const int requestUnsuccessful = 11;
  static const int requestNotFound = 12;
  static const int requestSuspended = 13;
  static const int requestUnpermited = 14;
  static const int requestInvalid = 15;
  static const int serviceUnavailable = 16;
  static const int preconditionFailed = 17;

  static const int noInternetConnection = 20;
}

class EventMessages {
  static const String preconditionFailed = 'Pre condition failed';
}
