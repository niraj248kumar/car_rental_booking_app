import 'package:car_rental_booking/provider_service/Database_service.dart';
import 'package:car_rental_booking/src/register/sing_up_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/CRB_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderPages>(context);
    final Size size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    return Scaffold(
      backgroundColor: CRBService.kcWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: h * 0.07),
                Text(
                  'Use Login',
                  style: TextStyle(
                    fontSize: w * 0.065,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: h * 0.01),

                /// Subtitle
                Text(
                  'Welcome! Please Login to your account',
                  style: TextStyle(
                    fontSize: 16,
                    color: CRBService.kcBlack,
                  ),
                ),

                SizedBox(height: h * 0.05),

                /// Email
                buildLabel('Email', w),
                SizedBox(height: 10,),
                buildTextField('example@gmail.com',provider.emailController),

                SizedBox(height: h * 0.025),
                /// Password
                buildLabel('Password', w),
                SizedBox(height: 10,),
                TextField(
                  controller: provider.passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: '1223Zsjf+-',
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w * 0.03),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.01),

                /// Forgot password
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: w * 0.035,
                      color: CRBService.kcBlue,
                    ),
                  ),
                ),

                SizedBox(height: h * 0.04),

                /// Sign In Button
                SizedBox(
                  width: double.infinity,
                  height: h * 0.065,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:CRBService.kcBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                      ),
                    ),
                    onPressed: () {
                      provider.login_functio(context,provider.emailController.text,provider.passwordController.text);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: w * 0.045,fontWeight: FontWeight.bold,color: CRBService.kcWhite),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.035),

                /// Divider text
                Text(
                  '- or sign in with -',
                  style: TextStyle(
                    color: CRBService.kcGrey,
                    fontSize: w * 0.035,
                  ),
                ),

                SizedBox(height: h * 0.010),


                /// Sign Up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: w * 0.035),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: w * 0.035,
                          color: CRBService.kcBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: h * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Reusable Widgets
  Widget buildLabel(String text, double w) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: w * 0.04,
          fontWeight: FontWeight.bold,
          color: CRBService.kcBlack
        ),
      ),
    );
  }

  Widget buildTextField(String hint,dynamic controller) {
    return TextField(
      controller:controller,
      decoration: InputDecoration(

        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

}
