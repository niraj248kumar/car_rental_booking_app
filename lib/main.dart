import 'package:car_rental_booking/provider_service/Database_service.dart';
import 'package:car_rental_booking/src/features/car/Screen/book/user_info.dart';
import 'package:car_rental_booking/src/features/car/Screen/home/home_screen.dart';
import 'package:car_rental_booking/src/splash/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProviderPages())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.mulishTextTheme(),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
