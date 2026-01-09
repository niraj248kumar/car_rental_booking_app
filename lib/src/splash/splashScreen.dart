// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double h = size.height;
//     final double w = size.width;
//
//     return
//       Scaffold(
//       backgroundColor: const Color(0xff0A7CFF), // Blue background
//       body: SafeArea(
//         child: Center(
//           child:
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               /// Circle with car icon
//               Container(
//                 height: w * 0.25,
//                 width: w * 0.25,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(
//                     color: Colors.white,
//                     width: w * 0.006,
//                   ),
//                 ),
//                 child: Icon(
//                   Icons.directions_car,
//                   color: Colors.white,
//                   size: w * 0.12,
//                 ),
//               ),
//
//               SizedBox(height: h * 0.03),
//
//               Text(
//                 'Car Rental',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: w * 0.06,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider_service/Database_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashScreen();

  }

  Future<void> splashScreen() async{
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var provider = Provider.of<ProviderPages>(context,listen: false);
      provider.register_splash(context);
    },);
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    return Scaffold(
        backgroundColor: const Color(0xff0A7CFF), // Blue background
        body: SafeArea(
          child: Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                /// Circle with car icon
                Container(
                  height: w * 0.25,
                  width: w * 0.25,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: w * 0.006,
                    ),
                  ),
                  child: Icon(
                    Icons.directions_car,
                    color: Colors.white,
                    size: w * 0.12,
                  ),
                ),

                SizedBox(height: h * 0.03),

                Text(
                  'Car Rental',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: w * 0.06,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
