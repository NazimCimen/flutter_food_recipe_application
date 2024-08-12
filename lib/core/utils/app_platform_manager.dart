import 'dart:io' show Platform;

class AppPlatformManager {
  void checkPlatform() {
    if (Platform.isAndroid) {
    } else if (Platform.isIOS) {
    } else {}
  }
}
