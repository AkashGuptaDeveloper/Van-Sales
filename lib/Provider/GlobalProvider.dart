// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
import 'package:vansales/GlobalComponents/Packages.dart';

//-InternetProvider-----------------------------------------------------------//
class CheckInternet with ChangeNotifier {
  var ChangeTextValue = GlobalFlag.Offline;
  final GlobalKey<State> keyLoader = GlobalKey<State>();
  String status = 'Online';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription streamSubscription;

  CheckInternet() {
    _checkInitialConnectivity();
    _startListening();
  }

  void _checkInitialConnectivity() async {
    var connectionResult = await _connectivity.checkConnectivity();
    _updateStatus(connectionResult);
  }

  void _startListening() {
    streamSubscription =
        _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      _updateStatus(result);
    });
  }

  void _updateStatus(ConnectivityResult connectionResult) {
    if (connectionResult == ConnectivityResult.mobile) {
      status = "Connected to MobileData";
      ChangeTextValue = GlobalFlag.Online;
    } else if (connectionResult == ConnectivityResult.wifi) {
      status = "Connected to Wifi";
      ChangeTextValue = GlobalFlag.Online;
    } else {
      status = "Offline";
      ChangeTextValue = GlobalFlag.Offline;
    }
    notifyListeners();
    /*if (kDebugMode) {
      print("================ChangeTextValue: $ChangeTextValue");
      print("================Status: $status");
    }*/
  }

//---------------------------resetState---------------------------------------//
  void resetState() {
    ChangeTextValue = GlobalFlag.Offline;
    streamSubscription.cancel();
    notifyListeners();
  }
}

//-BottomNavigationBarProvider------------------------------------------------//

class BottomNavigationBarProvider with ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  // Add a method to clear the currentIndex
  void clearIndex() {
    currentIndex = 0; // Set it to the default value (0 for "Home" screen)
    notifyListeners();
  }
}
