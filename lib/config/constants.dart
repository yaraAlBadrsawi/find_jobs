class Constants {
  static const double deviceWidth = 375;
  static const double deviceHeight = 812;
  static const int splashDuration = 3;
  static const int onBoardingDurationTime = 1;
  static const int sliderItems = 3;
}

class ConstantsPrefsKeys {
  static const String outBoardingViewedKey = 'on_boarding_viewed';
  static const String token = 'token';
  static const String email = 'email';
  static const String password = 'password';
  static const String loggedIn = 'logged_in';
}

String privacyPolicyIntro = 'Welcome to Find Jobs App .\n'
    ' This Privacy Policy outlines how we collect, '
    'use, and protect your personal information when you use our job-finding app.';

String privacyPolicy =
    'Information We Collect :\n Personal Information: We collect your name, email address,'
    ' and other necessary details during registration to create and manage your account\n'
    'Profile Information: You can provide additional details such as a profile picture, job preferences, and location to enhance your app experience.\nHow We Use Your Information:\n'
    'Account Management: We use your personal information to create and manage your account, provide job recommendations, and facilitate communication with potential employers.\n '
    'Communication: We may use your email address to send important notifications and updates related to job opportunities. \n'
    'Sharing Your Information:\n Employer Interaction: When you apply for a job, your profile and relevant information will be shared with the employer for consideration. \n'
    'Service Providers: We may share your information with service providers who assist in delivering our services, such as email communication or data analytics.';

List<Map<String, Object>> countryCodes = [
  {'code': '+972', 'index': 0},
  {'code': '+970', 'index': 1},
  {'code': '+20', 'index': 2},
  {'code': '+34', 'index': 3},
];

List<Map<String, Object>> country = [
  {
    'code': 'Israeil',
    'index': 0,
    'locations': [
      {'loc': 'Cairo', 'index': 0},
      {'loc': 'Alex', 'index': 1},
      {'loc': 'Port Said', 'index': 2},
      {'loc': 'Matrouh', 'index': 3},
    ]
  },
  {
    'code': 'Palestine',
    'index': 2,
    'locations': [
      {'loc': 'Abu Dhabi', 'index': 0},
      {'loc': 'Dubai', 'index': 1},
    ]
  },
  {
    'code': 'Saudi',
    'index': 1,
    'locations': [
      {'loc': 'Riadh', 'index': 0},
      {'loc': 'Jeddah', 'index': 1},
      {'loc': 'Mecca', 'index': 2},
    ]
  },

  {
    'code': 'Morocco',
    'index': 3,
    'locations': [
      {'loc': 'Fez', 'index': 0},
      {'loc': 'Marrakesh', 'index': 1},
      {'loc': 'Agader', 'index': 2},
    ]
  },
  // {
  //   'code': 'Kuwait',
  //   'index': 4,
  //   'locations': [
  //     {'loc': 'Mirqab', 'index': 0},
  //     {'loc': 'Dasman', 'index': 1},
  //     {'loc': 'Salhi', 'index': 2},
  //   ]
  // },
  {
    'code': 'Palestine',
    'index': 5,
    'locations': [
      {'loc': 'Haifa', 'index': 0},
      {'loc': 'Bethlehem', 'index': 1},
      {'loc': 'Nabulsi', 'index': 2},
      {'loc': 'Nazareth', 'index': 3},
    ]
  },
];
