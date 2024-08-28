//Para definir una classe que implemente la lógica del get (hasInternet)
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connetivity_repository.dart';
import '../services/remote/internet_checker.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  ConnectivityRepositoryImpl(
    this._connectivity,
    this._internetChecker,
  );
  //Esto a continuación se conoce como inyección de dependencias y permite que
  //nuestro código sea testeable
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;

  @override
  Future<bool> get hasInternet async {
    final result = await _connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) {
      return false;
    }

    return _internetChecker.hasInternet();
  }
}
