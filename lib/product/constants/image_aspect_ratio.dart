import 'package:image_cropper/image_cropper.dart';

enum ImageAspectRatioEnum {
  postAspectRatio,
  stepAspectRatio,
}

extension ImageAspectRatioExtension on ImageAspectRatioEnum {
  double get ratio {
    switch (this) {
      case ImageAspectRatioEnum.stepAspectRatio:
        return 2 / 1;
      case ImageAspectRatioEnum.postAspectRatio:
        return 5 / 4;
    }
  }
}

extension CropImageAspectRatioExtension on ImageAspectRatioEnum {
  CropAspectRatio get ratioCrop {
    switch (this) {
      case ImageAspectRatioEnum.stepAspectRatio:
        return const CropAspectRatio(ratioX: 16, ratioY: 9);
      case ImageAspectRatioEnum.postAspectRatio:
        return const CropAspectRatio(ratioX: 5, ratioY: 4);
    }
  }
}
