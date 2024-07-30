enum ImageEnums {
  defaultOnBoardImage,
  onboardBackground,
  leftButton,
  rightButton,
  appLogo,
  googleIcon,
  appleIcon,
}

extension AssetExtension on ImageEnums {
  String get toPathPng => 'assets/images/$name.png';
}
