import 'package:flutter_food_recipe_application/core/utils/firebase_utils/app_version_manager.dart';
import 'package:flutter_food_recipe_application/feauture/splash/domain/usecase/get_app_database_version_number.dart';
import 'package:flutter_food_recipe_application/feauture/splash/splash_export.dart';

class SplashViewModel {
  final CheckCacheOnboardShownUseCase checkCacheOnboardShownUseCase;
  final GetAppDatabaseVersionNumber getAppDatabaseVersionNumber;
  final AppVersionManager appVersionManager;
  SplashViewModel(
    this.checkCacheOnboardShownUseCase,
    this.getAppDatabaseVersionNumber,
    this.appVersionManager,
  );

  Future<bool> checkOnboardShown() async {
    final failureOrResult = await checkCacheOnboardShownUseCase.call();
    var result = false;
    failureOrResult.fold((fail) {
      result = false;
    }, (succes) {
      result = succes ?? false;
    });
    return result;
  }

  /// This method compares application version in firebase and device version.
  /// if return true it means there is force update
  Future<bool> checkForceUpdate() async {
    final databaseAppVersionNumber = await getAppDatabaseVersion();
    final deviceAppVersionNumber =
        await appVersionManager.getAppDeviceVersionInfo();
    if (databaseAppVersionNumber != null) {
      final isForce = appVersionManager.checkVersions(
        deviceAppVersionNumber: deviceAppVersionNumber,
        databaseAppVersionNumber: databaseAppVersionNumber,
      );
      return isForce;
    } else {
      return false;
    }
  }

  /// This method checks application version number in firestore
  Future<String?> getAppDatabaseVersion() async {
    String? databaseAppVersionNumber;
    final failuereOrVersion =
        await getAppDatabaseVersionNumber.checkAppDbVersion(
      platform: appVersionManager.getDevicePlatform(),
    );
    failuereOrVersion.fold((fail) {
      databaseAppVersionNumber = null;
    }, (dbAppVersion) {
      databaseAppVersionNumber = dbAppVersion.versionNumber;
    });
    return databaseAppVersionNumber;
  }
}
