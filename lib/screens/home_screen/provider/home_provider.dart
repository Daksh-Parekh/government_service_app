import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isConnected = false;
  var connected = Connectivity();

  void checkNetwork() async {
    List<ConnectivityResult> result = await connected.checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      isConnected = false;
    } else {
      isConnected = true;
    }
    notifyListeners();
  }

  void checkConnectivityAllTime() async {
    connected.onConnectivityChanged.listen(
      (event) {
        if (event.contains(ConnectivityResult.none)) {
          isConnected = false;
        } else {
          isConnected = true;
        }
        notifyListeners();
      },
    );
  }
}
