import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/models/app-model.dart';
import 'package:mirror_wall/utills/utills.dart';
import 'package:provider/provider.dart';

class ConnectivityProvider extends ChangeNotifier {
  Connectivity connectivity = Connectivity();
  Connectivity_Model connectivity_model =
      Connectivity_Model(connectivitystatus: "Waiting...");

  void CheckInternetConnectivity() {
    connectivity_model.connectivitystream = connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectivityResult) {
      switch (connectivityResult) {
        case ConnectivityResult.wifi:
          connectivity_model.connectivitystatus = "Wi-Fi";
          notifyListeners();
          break;
        case ConnectivityResult.mobile:
          connectivity_model.connectivitystatus = "Mobile Data";
          notifyListeners();
          break;
        default:
          connectivity_model.connectivitystatus = "waiting...";
          notifyListeners();
          break;
      }
    });
  }
}

class RadioButtonAccessProvider extends ChangeNotifier {
  RadioButtonAccess_Model radioButtonAccess_Model = RadioButtonAccess_Model(
    radiobuttonacess: "https://www.google.com/",
  );

  engine(url) async {
    inAppWebViewController?.loadUrl(
      urlRequest: URLRequest(
        url: Uri.parse(url),
      ),
    );
    notifyListeners();
  }
}
