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
}

extension AssetExtension on ImageEnums {
  String get toPathPng => 'assets/images/$name.png';
}
