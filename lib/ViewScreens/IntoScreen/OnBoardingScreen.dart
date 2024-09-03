// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
//----------------------------------------------------------------------------//
import 'package:flutter/material.dart';
import 'package:vansales/GlobalComponents/Packages.dart';

//----------------------------------------------------------------------------//
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

//----------------------------------------------------------------------------//
class OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _SnackBarscaffoldKey =
      GlobalKey<ScaffoldState>();

//----------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

//----------------------------------------------------------------------------//
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      Provider.of<CheckInternet>(context, listen: true);
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPopup, result) async =>
            GlobalFunction().ExitAppAlert(context),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          key: _SnackBarscaffoldKey,
          backgroundColor: GlobalAppColor.WhiteColorCode,
          body: SafeArea(
            child: IntroductionScreen(
              globalBackgroundColor: Colors.white,
              allowImplicitScrolling: false,
              initialPage: 0,
              infiniteAutoScroll: false,
              freeze: false,
              /*globalHeader: Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.only(top: 15.sp, right: 15.sp),
                    child: _buildImage(GlobalImage.LogoImg, 20.h),
                  ),
                ),
              ),*/
              pages: [
                PageViewModel(
                  title: "Learn about Van Sales",
                  body:
                      "Streamline your staff management in the most simplistic ways Leading the way modern staff management solutions.",
                  image: _buildImage('Van-Sales-Software.jpg'),
                  decoration: PageDecoration(
                    titleTextStyle: GoogleFonts.getFont(
                        GlobalFlag.GoogleFontsOpenSans,
                        fontStyle: FontStyle.normal,
                        color: GlobalAppColor.AppColorCode,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp),
                    bodyTextStyle: GoogleFonts.getFont(
                        GlobalFlag.GoogleFontsTruculenta,
                        fontStyle: FontStyle.normal,
                        color: GlobalAppColor.subTitleTextColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp),
                    bodyPadding:
                        const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                    pageColor: Colors.white,
                    imagePadding: EdgeInsets.zero,
                  ),
                ),
                PageViewModel(
                    title: "VanSales",
                    body:
                        "Customize attendance area with the office radius setting. Attendance marking is as simple as taking a selfie",
                    image: _buildImage('Van-Sales-Software.jpg'),
                    decoration: PageDecoration(
                      titleTextStyle: GoogleFonts.getFont(
                          GlobalFlag.GoogleFontsOpenSans,
                          fontStyle: FontStyle.normal,
                          color: GlobalAppColor.AppColorCode,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                      bodyTextStyle: GoogleFonts.getFont(
                          GlobalFlag.GoogleFontsTruculenta,
                          fontStyle: FontStyle.normal,
                          color: GlobalAppColor.subTitleTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                      bodyPadding:
                          const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      pageColor: Colors.white,
                      imagePadding: EdgeInsets.zero,
                    )),
                PageViewModel(
                    title: "Secure Login",
                    body:
                        "Track field force with a real-time location tracker. manage leave updates of your staff at your fingertips.",
                    image: _buildImage('Van-Sales-Software.jpg'),
                    decoration: PageDecoration(
                      titleTextStyle: GoogleFonts.getFont(
                          GlobalFlag.GoogleFontsOpenSans,
                          fontStyle: FontStyle.normal,
                          color: GlobalAppColor.AppColorCode,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp),
                      bodyTextStyle: GoogleFonts.getFont(
                          GlobalFlag.GoogleFontsTruculenta,
                          fontStyle: FontStyle.normal,
                          color: GlobalAppColor.subTitleTextColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp),
                      bodyPadding:
                          const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                      pageColor: Colors.white,
                      imagePadding: EdgeInsets.zero,
                    )),
              ],
              onDone: () => _onIntroEnd(context),
              onSkip: () => _onIntroEnd(context),
              // You can override onSkip callback
              showSkipButton: true,
              skipOrBackFlex: 0,
              nextFlex: 0,
              showBackButton: false,
              //rtl: true, // Display as right-to-left
              back: Icon(
                Icons.arrow_back,
                color: GlobalAppColor.WhiteColorCode,
              ),
              skip: Text('Skip',
                  style: GoogleFonts.getFont(
                    GlobalFlag.GoogleFonts,
                    fontStyle: FontStyle.normal,
                    color: GlobalAppColor.WhiteColorCode,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                  )),
              next: Icon(
                Icons.arrow_forward,
                color: GlobalAppColor.WhiteColorCode,
              ),
              done: Text('Done',
                  style: GoogleFonts.getFont(
                    GlobalFlag.GoogleFonts,
                    fontStyle: FontStyle.normal,
                    color: GlobalAppColor.WhiteColorCode,
                    fontWeight: FontWeight.w700,
                    fontSize: 11.sp,
                  )),
              curve: Curves.fastLinearToSlowEaseIn,
              controlsMargin: EdgeInsets.all(15.sp),
              controlsPadding: kIsWeb
                  ? EdgeInsets.all(12.0.sp)
                  : EdgeInsets.fromLTRB(0.0.sp, 4.0.sp, 0.0.sp, 4.0.sp),
              dotsDecorator: DotsDecorator(
                size: Size(5.0.sp, 5.0.sp),
                color: const Color(0xFFFFFFFF),
                activeSize: Size(22.0.sp, 5.0.sp),
                activeShape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                activeColor: GlobalAppColor
                    .OrangeColorCode, // Set your desired active color here
              ),
              dotsContainerDecorator: ShapeDecoration(
                color: GlobalAppColor.AppColorCode,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

//----------------------------------------------------------------------------//
  void _onIntroEnd(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

//----------------------------------------------------------------------------//
  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }
//---------------------------------------END-----------------------------------//
}
