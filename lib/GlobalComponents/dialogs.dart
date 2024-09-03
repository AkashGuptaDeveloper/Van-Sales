// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
//----------------------------------------------------------------------------//
import 'package:flutter/material.dart';
import 'package:vansales/GlobalComponents/Packages.dart';

final GlobalKey _loaderoneKey = GlobalKey();

class Dialogs {
  static void showProgressBar(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => PopScope(
            canPop: false,
            onPopInvoked: (didPopup) async => false,
            key: _loaderoneKey,
            child: Sizer(builder: (context, orientation, deviceType) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: GlobalAppColor.AppBarColorCode,
                strokeAlign: 5.0,
              ));
            })));
  }
}
