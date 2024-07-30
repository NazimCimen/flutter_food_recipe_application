enum ImageEnums {
  defaultOnBoardImage,
  onboardBackground,
  leftButton,
  rightButton,
  appLogo
}

extension AssetExtension on ImageEnums {
  String get toPathPng => 'assets/images/$name.png';
}
