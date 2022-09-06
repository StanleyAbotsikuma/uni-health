import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'utils/registration_provider.dart';
import 'utils/route.dart';

void main() {
  MultiProvider(providers: [
    Provider<RegistrationProvider>(create: (_) => RegistrationProvider()),
  ], child: const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Uni-Health',

          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: const MaterialColor(0xFF3b5998, {
              50: Color(0xFF3b5998),
              100: Color(0xFF3b5998),
              200: Color(0xFF3b5998),
              300: Color(0xFF3b5998),
              400: Color(0xFF3b5998),
              500: Color(0xFF3b5998),
              600: Color(0xFF3b5998),
              700: Color(0xFF3b5998),
              800: Color(0xFF3b5998),
              900: Color(0xFF3b5998),
            }),
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          initialRoute: "/",
          onGenerateRoute: GenerateRoute.onGenerateRoute,
        );
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
