class Endpoint {
  Endpoint._();
  static const String baseUrl = 'http://103.180.163.176/ydcpl_crm_testing';
  // static const String baseUrl = 'http://103.180.163.176/ydcpl_crm_development';
  static const String login = '${baseUrl}/api/auth/app-login';
  static const String coc = '${baseUrl}/api/auth/app-cocpopup';
  static const String logOut = '${baseUrl}/api/auth/app-logout';
  static const String profile = '${baseUrl}/api/auth/app-my-profile';
  static const String setting = '${baseUrl}/api/auth/app-settings-action';
  static const String appBarImage = '${baseUrl}/api/auth/app-bar-image';
  static const String getCount = '${baseUrl}/api/auth/get-total-records';
  static const String submit = '${baseUrl}/api/auth/app-fieldvisit-log-action';
  static const String getpostos = '${baseUrl}/api/auth/app-get-postos-list';
  static const String getScript = '${baseUrl}/api/auth/app-get-fos-script';
  static const String getLocationList =
      '${baseUrl}/api/auth/app-get-customer-location-list';
  static const String getportfolio =
      '${baseUrl}/api/auth/app-get-prtfolio-list';
  static const String mobileExist =
      '${baseUrl}/api/auth/is-app-customer-mobile-no-already-exists';
  static const String subCode =
      '${baseUrl}/api/auth/app-get-dispo-subcode-by-dispo-id';
  static const String getDispositionCode =
      '${baseUrl}/api/auth/app-get-disposition-codes';
  static const String addressExists =
      '${baseUrl}/api/auth/is-app-customer-address-already-exists';
  static const String addNewAddress =
      '${baseUrl}/api/auth/app-customer-address-action';
  static const String addMobile =
      '${baseUrl}/api/auth/app-customer-mobile-no-action';
  static const String mobileLogsList =
      '${baseUrl}/api/auth/app-customer-call-log';
  static const String fieldVisit =
      '${baseUrl}/api/auth/app-customer-field-visit-log';
  static const String viewDetails =
      '${baseUrl}/api/auth/app-view-customer-details';
  static const String customerAddress =
      '${baseUrl}/api/auth/app-customer-addresses';
  static const String customerMobile =
      '${baseUrl}/api/auth/app-customer-mobile-nos';
  static const String homelist =
      '${baseUrl}/api/auth/app-field-visit-allocation-list';
  static const String getNotification =
      '${baseUrl}/api/auth/app-notification-onoff-data';
  static const String notification =
      '${baseUrl}/api/auth/app-notification-onoff';
}
