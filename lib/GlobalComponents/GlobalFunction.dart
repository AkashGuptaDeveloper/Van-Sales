// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:vansales/GlobalComponents/Packages.dart';

//----------------------------------------------------------------------------//
final GlobalKey<ScaffoldState> _GlobalMsgAlert = GlobalKey<ScaffoldState>();

//=============================GlobalFunction=================================//
class GlobalFunction {
  final GlobalKey<ScaffoldState> _KeyExitApp = GlobalKey<ScaffoldState>();

//-------------------------------AppBarTitle----------------------------------//
  Widget NoInterNet() {
    return Sizer(builder: (context, orientation, deviceType) {
      return Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100.sp,
            child: Image.asset(
              GlobalImage.OfflineImg,
              fit: BoxFit.contain,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 15.0.sp, right: 15.0.sp),
              padding: EdgeInsets.all(5.0.sp),
              child: Text(
                GlobalFlag.NotConnected,
                textAlign: TextAlign.center,
                style: GoogleFonts.getFont(
                  GlobalFlag.GoogleFontsTruculenta,
                  fontStyle: FontStyle.normal,
                  color: GlobalAppColor.BtnNoCode,
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                ),
              )),
        ],
      ));
    });
  }

//----------------------------ExitAppAlert------------------------------------//
  ExitAppAlert(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) => PopScope(
          canPop: false,
          onPopInvoked: (didPopup) async => false,
          key: _KeyExitApp,
          child: Sizer(builder: (context, orientation, deviceType) {
            return AlertDialog(
              backgroundColor: GlobalAppColor.WhiteColorCode,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
                  side: BorderSide(
                      width: 0.0.w, color: GlobalAppColor.AppBarColorCode)),
              contentPadding: EdgeInsets.all(0.0.sp),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: SizedBox(
                      child: Center(
                        child: Text("Exit",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              GlobalFlag.GoogleFontsOpenSans,
                              fontStyle: FontStyle.normal,
                              color: GlobalAppColor.titleTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            )),
                      ),
                    ),
                  ),
                  Divider(
                    color: GlobalAppColor.AppBarColorCode,
                    thickness: 0.2.sp,
                    height: 0.5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: GlobalAppColor
                        .BackgroundColorCode, // Hardcoded color value
                    child: Padding(
                      padding: EdgeInsets.all(20.0.sp),
                      child: Text(
                        "Do you want to exit an app?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          GlobalFlag.GoogleFontsTruculenta,
                          fontStyle: FontStyle.normal,
                          color: GlobalAppColor.BlackColorCode,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: GlobalAppColor.AppBarColorCode,
                    thickness: 0.2.sp,
                    height: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                topRight: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                bottomLeft: Radius.circular(10.0.sp),
                                // Adjust the radius as needed
                                bottomRight: Radius.circular(
                                    0.0.sp), // Adjust the radius as needed
                              ),
                              color: GlobalAppColor.AppBarColorCode,
                            ),
                            child: CupertinoButton(
                              disabledColor: GlobalAppColor.AppBarColorCode,
                              color: GlobalAppColor.AppBarColorCode,
                              padding: EdgeInsets.all(0.0.sp),
                              child: Text(
                                GlobalFlag.Yes,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFontsOpenSans,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.WhiteColorCode,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                              onPressed: () {
                                GlobalFunction.hideKeyboard(context);
                                Navigator.of(context).pop();
                                exit(0);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 0.5.sp),
                      Flexible(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                topRight: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                bottomLeft: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                bottomRight: Radius.circular(
                                    10.0.sp), // Adjust the radius as needed
                              ),
                              color: GlobalAppColor.AppBarColorCode,
                            ),
                            child: CupertinoButton(
                              disabledColor: GlobalAppColor.AppBarColorCode,
                              color: GlobalAppColor.AppBarColorCode,
                              padding: EdgeInsets.all(0.0.sp),
                              child: Text(
                                GlobalFlag.No,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFontsOpenSans,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.WhiteColorCode,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.sp,
                                ),
                              ),
                              onPressed: () {
                                GlobalFunction.hideKeyboard(context);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          })),
    );
  }

//----------------------------LogOutAlert-------------------------------------//
  LogOutAlert(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) => PopScope(
          canPop: false,
          onPopInvoked: (didPopup) async => false,
          key: _KeyExitApp,
          child: Sizer(builder: (context, orientation, deviceType) {
            return AlertDialog(
              backgroundColor: GlobalAppColor.WhiteColorCode,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0.sp)),
                  side: BorderSide(
                      width: 0.0.w, color: GlobalAppColor.AppBarColorCode)),
              contentPadding: EdgeInsets.all(0.0.sp),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: SizedBox(
                      child: Center(
                        child: Text("Logout",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              GlobalFlag.GoogleFontsOpenSans,
                              fontStyle: FontStyle.normal,
                              color: GlobalAppColor.titleTextColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            )),
                      ),
                    ),
                  ),
                  Divider(
                    color: GlobalAppColor.AppBarColorCode,
                    thickness: 0.2.sp,
                    height: 0.5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    color: GlobalAppColor
                        .BackgroundColorCode, // Hardcoded color value
                    child: Padding(
                      padding: EdgeInsets.all(20.0.sp),
                      child: Text(
                        "Do you want to log out an app?",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          GlobalFlag.GoogleFontsTruculenta,
                          fontStyle: FontStyle.normal,
                          color: GlobalAppColor.BlackColorCode,
                          fontWeight: FontWeight.w400,
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: GlobalAppColor.AppBarColorCode,
                    thickness: 0.2.sp,
                    height: 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                topRight: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                bottomLeft: Radius.circular(10.0.sp),
                                // Adjust the radius as needed
                                bottomRight: Radius.circular(
                                    0.0.sp), // Adjust the radius as needed
                              ),
                              color: GlobalAppColor.AppBarColorCode,
                            ),
                            child: CupertinoButton(
                              disabledColor: GlobalAppColor.AppBarColorCode,
                              color: GlobalAppColor.AppBarColorCode,
                              padding: EdgeInsets.all(0.0.sp),
                              child: Text(
                                GlobalFlag.Yes,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFontsOpenSans,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.WhiteColorCode,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                ),
                              ),
                              onPressed: () async {
                                GlobalFunction.hideKeyboard(context);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 0.5.sp),
                      Flexible(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                topRight: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                bottomLeft: Radius.circular(0.0.sp),
                                // Adjust the radius as needed
                                bottomRight: Radius.circular(
                                    10.0.sp), // Adjust the radius as needed
                              ),
                              color: GlobalAppColor.AppBarColorCode,
                            ),
                            child: CupertinoButton(
                              disabledColor: GlobalAppColor.AppBarColorCode,
                              color: GlobalAppColor.AppBarColorCode,
                              padding: EdgeInsets.all(0.0.sp),
                              child: Text(
                                GlobalFlag.No,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFontsOpenSans,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.WhiteColorCode,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.sp,
                                ),
                              ),
                              onPressed: () {
                                GlobalFunction.hideKeyboard(context);
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          })),
    );
  }

//--------------------------------PortraitMode--------------------------------//
  Future<void> setPortrait() async =>
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

//==================================ToastMsg==================================//
  void ShowMsg(BuildContext context, MSG) async {
    Fluttertoast.showToast(
      msg: MSG,
      fontSize: 16,
      textColor: GlobalAppColor.WhiteColorCode,
      backgroundColor: GlobalAppColor.BlackColorCode,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
    );
  }

//------------------------------------AppPermission---------------------------//
  Future<void> AppPermission() async {
    await Permission.camera.request();
    await Permission.microphone.request();
    await Permission.phone.request();
    await Permission.storage.request();
    await Permission.notification.request();
  }

//------------------------------------hideKeyboard----------------------------//
  static void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

//------------------------MessageAlert-----------------------------------------//
  Future<void> MessageAlert(
      BuildContext context, String Msg, String MsgBtn) async {
    return showDialog(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) => PopScope(
          canPop: false,
          onPopInvoked: (didPopup) async => false,
          key: _GlobalMsgAlert,
          child: Sizer(builder: (context, orientation, deviceType) {
            return AlertDialog(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0.sp))),
              contentPadding: EdgeInsets.only(top: 0.0.sp),
              content: Container(
                margin: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: 10.0.sp,
                      ),
                      margin: EdgeInsets.only(top: 10.0.sp, right: 8.0.sp),
                      decoration: BoxDecoration(
                          color: GlobalAppColor.BorderColorCode,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const <BoxShadow>[
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 0.0,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Text(
                              Msg,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.getFont(
                                GlobalFlag.GoogleFontsTruculenta,
                                fontStyle: FontStyle.normal,
                                color: GlobalAppColor.BlackColorCode,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ) //
                              ),
                          SizedBox(height: 1.5.h),
                          InkWell(
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 10.0.sp, bottom: 10.0.sp),
                              decoration: BoxDecoration(
                                color: GlobalAppColor.AppColorCode,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12.0.sp),
                                    bottomRight: Radius.circular(12.0.sp)),
                              ),
                              child: Text(
                                MsgBtn,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFontsOpenSans,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.WhiteColorCode,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.sp,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Align(
                          alignment: Alignment.topRight,
                          child: CircleAvatar(
                            radius: 12.0.sp,
                            backgroundColor: GlobalAppColor.AppColorCode,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }

//----------------------------checkPermission---------------------------------//
  Future checkPermission() async {
    final permission = await Permission.camera.status;
    final audio = await Permission.microphone.status;

    if (kDebugMode) {
      print("permission camera : $permission");
      print("audio : $audio");
    }

    if (!permission.isGranted) {
      await Permission.camera.request().then((value) async {
        if (!audio.isGranted) {
          await Permission.microphone.request();
        }
      });
    } else {
      if (!audio.isGranted) {
        await Permission.microphone.request();
      }
    }

    return Future.value(true);
  }
}
