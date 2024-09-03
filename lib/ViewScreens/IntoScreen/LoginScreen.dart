// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
//----------------------------------------------------------------------------//
import 'package:flutter/material.dart';
import 'package:vansales/GlobalComponents/Packages.dart';

//----------------------------------------------------------------------------//
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

//----------------------------------------------------------------------------//
class LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> LoaderKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _SnackBarscaffoldKey =
      GlobalKey<ScaffoldState>();
  TextEditingController PasswordController = TextEditingController();
  final FocusNode myFocusNodePassword = FocusNode();
  TextEditingController UserIDController = TextEditingController();
  final FocusNode myFocusNodeUserID = FocusNode();
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  ValueNotifier<bool> toggleCredential = ValueNotifier<bool>(false);

//----------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

//----------------------------------------------------------------------------//
  @override
  void dispose() {
    super.dispose();
    UserIDController.dispose();
    myFocusNodeUserID.dispose();
    PasswordController.dispose();
    myFocusNodePassword.dispose();
    toggle.dispose();
    toggleCredential.dispose();
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
                child: GestureDetector(
              onTap: () {
                GlobalFunction.hideKeyboard(context);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
//----------------------------------------------------------------------------//
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.003.h),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(left: 15.0.sp, right: 15.0.sp),
                      child: Image.asset(
                        GlobalImage.OfflineImg,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: 12.h,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005.h),
                  Text(
                    "Account Sing In",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      GlobalFlag.GoogleFonts,
                      fontStyle: FontStyle.normal,
                      color: const Color(0xFF252626),
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0.sp,
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.002.h),
                  Text("Glad to see you!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        GlobalFlag.GoogleFontsOpenSans,
                        fontStyle: FontStyle.normal,
                        color: GlobalAppColor.AppColorCode,
                        fontWeight: FontWeight.w200,
                        fontSize: 12.0.sp,
                      )),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.006.h),
                  Expanded(
                      child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.65,
                      decoration: BoxDecoration(
                        color: GlobalAppColor.BackgroundColorCode,
                        border: Border.all(
                          color: GlobalAppColor.BackgroundColorCode,
                          width: 2.0.sp,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              22.sp), // Adjust the radius as needed
                          topRight: Radius.circular(22.sp),
                        ),
                      ),
                      padding: EdgeInsets.only(left: 5.0.sp, right: 5.0.sp),
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
//---------------------------------------User ID------------------------------//
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.003.h),
                            Text("User Email",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.getFont(
                                  GlobalFlag.GoogleFonts,
                                  fontStyle: FontStyle.normal,
                                  color: GlobalAppColor.BlackColorCode,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 13.sp,
                                )),
                            SizedBox(height: 0.7.h),
                            SizedBox(
                              height: 6.0.h,
                              width: MediaQuery.of(context).size.width,
                              child: CupertinoTextField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'\s')),
                                  ],
                                  enabled: false,
                                  enableSuggestions: true,
                                  showCursor: true,
                                  textCapitalization: TextCapitalization.words,
                                  textAlign: TextAlign.start,
                                  autocorrect: true,
                                  cursorColor: GlobalAppColor.AppColorCode,
                                  style: GoogleFonts.getFont(
                                      GlobalFlag.GoogleFontsOpenSans,
                                      fontStyle: FontStyle.normal,
                                      color: GlobalAppColor.AppColorCode,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp),
                                  focusNode: myFocusNodeUserID,
                                  controller: UserIDController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.text,
                                  placeholder: "Enter User Email",
                                  placeholderStyle: GoogleFonts.getFont(
                                      GlobalFlag.GoogleFontsOpenSans,
                                      fontStyle: FontStyle.normal,
                                      color: GlobalAppColor.subTitleTextColor,
                                      fontWeight: FontWeight.w100,
                                      fontSize: 11.sp),
                                  suffix: Container(
                                    margin: EdgeInsets.only(right: 10.sp),
                                    child: Icon(
                                      CupertinoIcons.person_fill,
                                      size: 15.0.sp,
                                      color: GlobalAppColor.AppColorCode,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.sp),
                                    border: Border.all(
                                        color: GlobalAppColor.BorderColorCode,
                                        width: 0.3.w),
                                  )),
                            ),
//---------------------------------------User Password------------------------//
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.004.h),
                            Text(
                              "Password",
                              textAlign: TextAlign.start,
                              style: GoogleFonts.getFont(
                                GlobalFlag.GoogleFonts,
                                fontStyle: FontStyle.normal,
                                color: GlobalAppColor.BlackColorCode,
                                fontWeight: FontWeight.w300,
                                fontSize: 13.sp,
                              ),
                            ),
                            SizedBox(height: 0.7.h),
                            ValueListenableBuilder(
                                valueListenable: toggle,
                                builder: (context, value, child) {
                                  return SizedBox(
                                    height: 6.0.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: CupertinoTextField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.deny(
                                              RegExp(r'\s')),
                                        ],
                                        enabled: false,
                                        obscureText: toggle.value,
                                        enableSuggestions: true,
                                        clearButtonMode:
                                            OverlayVisibilityMode.editing,
                                        showCursor: true,
                                        textCapitalization:
                                            TextCapitalization.words,
                                        textAlign: TextAlign.start,
                                        autocorrect: true,
                                        cursorColor:
                                            GlobalAppColor.AppColorCode,
                                        style: GoogleFonts.getFont(
                                            GlobalFlag.GoogleFontsOpenSans,
                                            fontStyle: FontStyle.normal,
                                            color: GlobalAppColor.AppColorCode,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp),
                                        focusNode: myFocusNodePassword,
                                        controller: PasswordController,
                                        textInputAction: TextInputAction.done,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        placeholder: "Enter Password",
                                        placeholderStyle: GoogleFonts.getFont(
                                            GlobalFlag.GoogleFontsOpenSans,
                                            fontStyle: FontStyle.normal,
                                            color: GlobalAppColor
                                                .subTitleTextColor,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 11.sp),
                                        suffix: Container(
                                          margin: EdgeInsets.only(right: 10.sp),
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                toggle.value = !toggle.value;
                                              });
                                            },
                                            child: Icon(
                                              toggle.value
                                                  ? CupertinoIcons.eye_fill
                                                  : CupertinoIcons
                                                      .eye_slash_fill,
                                              size: 15.0.sp,
                                              color:
                                                  GlobalAppColor.AppColorCode,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.sp),
                                          border: Border.all(
                                              color: GlobalAppColor
                                                  .BorderColorCode,
                                              width: 0.3.w),
                                        )),
                                  );
                                }),
//--------------------------Remember my credentials-ForgotPassword------------//
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.003.h),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forget Password?',
                                  style: GoogleFonts.getFont(
                                    GlobalFlag.GoogleFontsOpenSans,
                                    fontStyle: FontStyle.normal,
                                    color: GlobalAppColor.AppColorCode,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 13.sp,
                                    decoration: TextDecoration.underline,
                                    decorationColor:
                                        GlobalAppColor.AppColorCode,
                                    decorationThickness: 2.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            ValueListenableBuilder(
                                valueListenable: toggleCredential,
                                builder: (context, value, child) {
                                  return Sizer(builder:
                                      (context, orientation, deviceType) {
                                    return Transform.translate(
                                      offset: Offset(
                                        10.sp,
                                        0.sp,
                                      ),
                                      child: ListTileTheme(
                                        contentPadding: EdgeInsets.all(0.sp),
                                        dense: true,
                                        horizontalTitleGap: 0.sp,
                                        child: CheckboxListTile(
                                          dense: true,
                                          contentPadding: EdgeInsets.only(
                                              left: 0.sp, right: 0.sp),
                                          visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity,
                                          ),
                                          title: Align(
                                            alignment: Alignment.topRight,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  right: 5.0.sp),
                                              child: Text(
                                                "Remember my credentials",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.getFont(
                                                  GlobalFlag
                                                      .GoogleFontsOpenSans,
                                                  fontStyle: FontStyle.normal,
                                                  color: GlobalAppColor
                                                      .AppColorCode,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 13.sp,
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: toggleCredential.value,
                                          onChanged: (val) {
                                            setState(() {
                                              toggleCredential.value = val!;
                                            });
                                          },
                                          activeColor:
                                              GlobalAppColor.AppColorCode,
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                        ),
                                      ),
                                    );
                                  });
                                }),
//--------------------------LoginBtn------------------------------------------//
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.004.h),
                            Consumer<CheckInternet>(
                                builder: (context, providerValue, child) {
                              return SizedBox(
                                width: MediaQuery.of(context).size.width - 20,
                                child: CupertinoButton(
                                  disabledColor: GlobalAppColor.ButtonColorCode,
                                  color: GlobalAppColor.ButtonColorCode,
                                  borderRadius: BorderRadius.circular(5.0.sp),
                                  padding: EdgeInsets.all(0.sp),
                                  alignment: Alignment.center,
                                  onPressed: () async {
                                    GlobalFunction.hideKeyboard(context);
                                    var result = await Connectivity()
                                        .checkConnectivity();
                                    if (result == ConnectivityResult.none) {
                                      if (!context.mounted) return;
                                      GlobalFunction().MessageAlert(
                                          context,
                                          GlobalFlag.NotConnected,
                                          GlobalFlag.Cancel);
                                    } else {
                                      final emailRegex =
                                          RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
                                      setState(() {
                                        if (UserIDController.text.isEmpty) {
                                          GlobalFunction()
                                              .ShowMsg(context, "Enter Email");
                                        } else if (!emailRegex
                                            .hasMatch(UserIDController.text)) {
                                          GlobalFunction().ShowMsg(
                                              context, "Invalid Email Address");
                                        } else if (PasswordController.text
                                                .trim() ==
                                            '') {
                                          GlobalFunction().ShowMsg(
                                              context, "Enter Password");
                                        } else {
                                          toggle = ValueNotifier<bool>(true);

                                          GlobalFunction().ShowMsg(
                                              context, "Work In Progress");
                                        }
                                      });
                                    }
                                  },
                                  child: Text(
                                    "Login",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.getFont(
                                      GlobalFlag.GoogleFontsOpenSans,
                                      fontStyle: FontStyle.normal,
                                      color: GlobalAppColor.WhiteColorCode,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                                //}
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  )),
                ],
              ),
            ))),
      );
    });
  }
//---------------------------------------END----------------------------------//
}
