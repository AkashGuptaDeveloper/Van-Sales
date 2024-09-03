// ignore_for_file: file_names, non_constant_identifier_names, use_build_context_synchronously, depend_on_referenced_packages, unnecessary_null_comparison, avoid_function_literals_in_foreach_calls
import 'package:flutter/material.dart';
import 'package:vansales/GlobalComponents/Packages.dart';

//---------------------------main-Method--------------------------------------//

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final navigatorKey = GlobalKey<NavigatorState>();
  HttpOverrides.global = MyHttpOverrides();
  await GlobalFunction().setPortrait();
  await GlobalFunction().AppPermission();
  GestureBinding.instance.resamplingEnabled = true;
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: GlobalAppColor.AppColorCode));
  //for setting orientation to portrait only
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((value) {
    runApp(MyApp(navigatorKey: navigatorKey));
  });
}

//---------------------------------StatelessWidget----------------------------//
class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    required this.navigatorKey,
    super.key,
  });

//----------------------------Generated-Widget build-------------------------//
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: GlobalAppColor.AppColorCode));
    MaterialColor colorCustom = MaterialColor(0xFF19427C, GlobalAppColor.color);
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CheckInternet()),
          ChangeNotifierProvider(
              create: (context) => BottomNavigationBarProvider()),
        ],
        child: MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          theme: ThemeData(
            primarySwatch: colorCustom,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ).copyWith(
            scrollbarTheme: const ScrollbarThemeData().copyWith(
              thumbColor: WidgetStateProperty.all(colorCustom),
              trackVisibility: WidgetStateProperty.all(true),
              trackColor: WidgetStateProperty.all(colorCustom),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
        ),
      );
    });
  }
}

//---------------------------------MyHttpOverrides----------------------------//
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

//----------------------------------------------------------------------------//
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

//-------------------------------------END-------------------------------------//
