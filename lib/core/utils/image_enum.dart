enum ImageEnums {
  defaultOnBoardImage,
  onboardBackground,
  leftButton,
  rightButton,
  appLogo,
  googleIcon,
  appleIcon,
  onboardImage1,
  onboardImage2,
  onboardImage3,
  authBackgroundImage,
  yellowSemiCircle,
  food1,
  food2,
  food3,
  sharePostImage,
  sharePostImageBack,
  shareRecipeBack,
  cook,
  test1,
  test2,
  test3,
  test4,
  test5,
  test6,
  test7,
  test8
}

extension AssetExtension on ImageEnums {
  String get toPathPng => 'assets/images/$name.png';
}
