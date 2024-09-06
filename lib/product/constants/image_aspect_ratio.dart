import 'package:image_cropper/image_cropper.dart';

enum ImageAspectRatio {
  postAspectRatio,
  stepAspectRatio,
}

extension ImageAspectRatioExtension on ImageAspectRatio {
  double get ratio {
    switch (this) {
      case ImageAspectRatio.stepAspectRatio:
        return 2 / 1;
      case ImageAspectRatio.postAspectRatio:
        return 5 / 4;
    }
  }
}

/*enum CropImageAspectRatio {
  postAspectRatio,
  stepAspectRatio,
}

class CropAspectRatio {
  final double ratioX;
  final double ratioY;

  CropAspectRatio({required this.ratioX, required this.ratioY});
}

extension CropImageAspectRatioExtension on CropImageAspectRatio {
  CropAspectRatio get ratio {
    switch (this) {
      case CropImageAspectRatio.stepAspectRatio:
        return CropAspectRatio(ratioX: 16, ratioY: 9);
      case CropImageAspectRatio.postAspectRatio:
        return CropAspectRatio(ratioX: 1, ratioY: 1);
    }
  }
}
*/