// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
//----------------------------------------------------------------------------//
import 'package:flutter/material.dart';
import 'package:vansales/GlobalComponents/Packages.dart';

//----------------------------------------------------------------------------//
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

//----------------------------------------------------------------------------//
class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _SnackBarscaffoldKey =
      GlobalKey<ScaffoldState>();

//----------------------------------------------------------------------------//
  void handleTimeout() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
    );
  }

//----------------------------------------------------------------------------//
  startTimeout() async {
    var duration = const Duration(seconds: 5);
    return Timer(
      duration,
      handleTimeout,
    );
  }

//----------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    startTimeout();
  }

//----------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      Provider.of<CheckInternet>(context, listen: true);
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPopup, result) async => false,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            key: _SnackBarscaffoldKey,
            backgroundColor: GlobalAppColor.WhiteColorCode,
            appBar: AppBar(
              backgroundColor: GlobalAppColor.WhiteColorCode,
              automaticallyImplyLeading: false,
              excludeHeaderSemantics: true,
              toolbarHeight: 0.h,
              flexibleSpace: Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: GlobalAppColor.AppColorCode),
              elevation: 0,
              centerTitle: true,
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Center(
                  child: Image.asset(
                    GlobalImage.OfflineImg,
                    width: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: EdgeInsets.only(bottom: 10.0.sp),
              child: AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TypewriterAnimatedText(
                    GlobalFlag.AppDeveloperCompany,
                    textAlign: TextAlign.center,
                    textStyle: GoogleFonts.getFont(
                      'Oswald',
                      textStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: GlobalAppColor.AppColorCode,
                          fontWeight: FontWeight.w400,
                          fontSize: 11.sp,
                          height: 1.4),
                    ),
                    speed: const Duration(milliseconds: 120),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 120),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
            )),
      );
    });
  }
//---------------------------------------END-----------------------------------//
}
