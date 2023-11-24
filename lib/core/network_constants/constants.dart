import 'package:ardwtalab/core/network_constants/local_constants.dart';

class Constants {
  final String id;

  static const String baseUrl =
      "https://sender.fudex-tech.net/ard-w-talab/public/api";
  static String token = "Bearer $accessToken";
  static String secToken =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3NlbmRlci5mdWRleC10ZWNoLm5ldC9hcmQtdy10YWxhYi9wdWJsaWMvYXBpL2N1c3RvbWVyLWF1dGgvbG9naW4iLCJpYXQiOjE2OTk2NDgwOTIsImV4cCI6MTcwMDg1NzY5MiwibmJmIjoxNjk5NjQ4MDkyLCJqdGkiOiJmTjJZUG5LM1ZBaXg0TFBuIiwic3ViIjoiOSIsInBydiI6IjFkMGEwMjBhY2Y1YzRiNmM0OTc5ODlkZjFhYmYwZmJkNGU4YzhkNjMifQ.IdpaPBII9DvfqKwKQS8_WPVRt5Mc37J01xauthGQOKE";
  Constants({
    required this.id,
  });
  static const String homeAds = "/ads/home";
  //app  departmet
  static const String department = "/v2/get-departments";
  static const String parentCategoriescars = "/v2/get-parent-categories/1";
  static const String prentCategoeiesVans = "/v2/get-sub-categories/673";
  static const String prentCategoeiesRealState = "/v2/get-sub-categories/13";
  static const String parentCategoriesDevices = "/v2/get-parent-categories/4";
  static const String parentCategoriescarNumbers =
      "/v2/get-parent-categories/31";
  // new add
  static const String createNewAd = "/ad";
  // following
  static const String following = "/customer/following";
  static const String followAndUnfollow = "/customer/follow";
  // favorite
  static const String customerFavorites = "/customer/favorites";
  //profile
  static const String customerProfile = "/customer/profile";
  // change password
  static const String changePassword = "/customer/change-password";
  // my ads
  static const String myAds = "/customer/my-ads";
  //privacy
  static const String privacy = "/pages/3";
  // terms and conditions
  static const String termsAndConditions = "/pages/2";
  // About ard w talab
  static const String aboutUS = "/pages/1";
  // Notifications
  static const String customerNotifications = "/customer/notifications";
  // /contact_us
  static const String contactus = "/contact_us";

  //get-regions
  static const String regionWithCities = "/get-regions";
  // rate other customer
  static const String rateOtherCustomer = "/customer/rating";

  // chat
  static const String chatList = "/chat/getRooms";
  static const String sendChat = "/chat";
  //auth
  static const String login = "/customer-auth/login";
}
