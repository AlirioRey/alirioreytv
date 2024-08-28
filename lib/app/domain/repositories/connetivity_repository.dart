//Repositorio para saber si tenenmos acceso a internet
abstract class ConnectivityRepository {
  Future<bool> get hasInternet; //Definición de una abstracción
}
