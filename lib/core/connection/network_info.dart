import 'package:connectivity_plus/connectivity_plus.dart';

/// İnternet bağlantısını kontrol etmek için kullanılan arayüz.
abstract class NetworkInfoI {
  Future<ConnectivityResult> get getConnectionType;
  Future<bool> get currentConnectivityResult;
}

class NetworkInfo implements NetworkInfoI {
  final Connectivity connectivity;

  static final NetworkInfo _instance = NetworkInfo._internal(Connectivity());
  factory NetworkInfo() {
    return _instance;
  }
  NetworkInfo._internal(this.connectivity);

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
