

import 'package:connectivity/connectivity.dart';

class InternetConnection{

  Connectivity connectivity;


  InternetConnection(this.connectivity);

  Future<bool> checkConnectivity() async {
    var connectivityResult = await (connectivity.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi)
      return true;
    else
      return false;
  }

}