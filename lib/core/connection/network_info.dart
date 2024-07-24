import 'package:flutter_food_recipe_application/core/app_core_export.dart';

/// İnternet bağlantısını kontrol etmek için kullanılan arayüz.
abstract class INetworkInfo {
  Future<ConnectivityResult> get getConnectionType;
  Future<bool> get currentConnectivityResult;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  @override
  Future<ConnectivityResult> get getConnectionType async {
    final result = await connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile)) {
      return ConnectivityResult.mobile;
    } else if (result.contains(ConnectivityResult.wifi)) {
      return ConnectivityResult.wifi;
    } else {
      return ConnectivityResult.none;
    }
  }

  @override
  Future<bool> get currentConnectivityResult async {
    final result = await connectivity.checkConnectivity();
    if (result.contains(ConnectivityResult.mobile) == false &&
        result.contains(ConnectivityResult.wifi) == false) {
      return false;
    } else {
      return true;
    }
  }
}
