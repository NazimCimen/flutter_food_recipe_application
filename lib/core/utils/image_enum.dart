enum ImageEnums {
  defaultOnBoardImage,
  onboardBackground,
  leftButton,
  rightButton
}

extension AssetExtension on ImageEnums {
  String get toPathPng => 'assets/images/$name.png';
}
