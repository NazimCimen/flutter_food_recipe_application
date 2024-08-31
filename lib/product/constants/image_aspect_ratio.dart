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
