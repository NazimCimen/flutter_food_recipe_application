enum ImageEnums { defaultOnBoardImage }

extension AssetExtension on ImageEnums {
  String get toPathPng => 'assets/images/$name.png';
}
