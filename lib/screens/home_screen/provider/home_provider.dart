import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:government_service_app/screens/home_screen/model/service_model.dart';
import 'package:government_service_app/utils/helper/shr_helper.dart';

class HomeProvider with ChangeNotifier {
  bool isConnected = false;
  var connected = Connectivity();
  List<GovServiceModel> allOptions = [
    GovServiceModel(
        title: 'Home',
        webUril: 'https://uidai.gov.in/en/',
        icons: Icons.home_rounded),
    GovServiceModel(
        title: 'Update Aadhaar',
        webUril: 'https://uidai.gov.in/en/my-aadhaar/update-aadhaar.html',
        icons: Icons.touch_app_rounded),
    GovServiceModel(
        title: 'Get Aadhaar',
        webUril: 'https://uidai.gov.in/en/my-aadhaar/get-aadhaar.html',
        icons: Icons.get_app_rounded),
    GovServiceModel(
        title: 'Aadhaar Service',
        webUril:
            'https://uidai.gov.in/en/my-aadhaar/avail-aadhaar-services.html',
        icons: Icons.miscellaneous_services_rounded),
  ];
  double progressValue = 0;
  //One Time check Connectivity
  void checkNetwork() async {
    List<ConnectivityResult> result = await connected.checkConnectivity();
    if (result.contains(ConnectivityResult.none)) {
      isConnected = false;
    } else {
      isConnected = true;
    }
    notifyListeners();
  }

  //Immediately Check Connectivity all time
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

  void changeProgressValue(double value) {
    progressValue = value;
    notifyListeners();
  }

  bool isTheme = false;
  ThemeMode? mode;
  void changeTheme() {
    isTheme = !isTheme;
    ShrHelper helps = ShrHelper();

    // mode = isTheme ? ThemeMode.light : ThemeMode.dark;
    helps.saveTheme(isTheme);
    notifyListeners();
  }

  void getThemes() async {
    ShrHelper hepls = ShrHelper();

    isTheme = await hepls.getTheme() ?? false;
    //  isTheme= hepls.getTheme();
    // isTheme=ShrHelper.helper.getTheme();
    notifyListeners();
  }
}
