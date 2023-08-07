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
