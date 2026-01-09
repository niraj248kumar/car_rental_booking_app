import 'package:car_rental_booking/src/register/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider_service/Database_service.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderPages>(context);
    final Size size = MediaQuery.of(context).size;
    final double h = size.height;
    final double w = size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.07),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox(height: h * 0.05),

                Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: w * 0.065,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: h * 0.01),
                Text(
                  'Fill your information below or register',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: w * 0.055,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: h * 0.04),

                /// Name
                buildLabel('Name', w),
                buildTextField('User Name', provider.nameController),

                SizedBox(height: h * 0.025),

                /// Email
                buildLabel('Email', w),
                buildTextField('example@gmail.com',provider.emailController),
                SizedBox(height: h * 0.025),

                /// Password
                buildLabel('Password', w),
                TextField(
                  controller: provider.passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: '1232Zsjf+-',
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
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

                SizedBox(height: h * 0.055),

                /// Sign Up Button
                SizedBox(
                  width: double.infinity,
                  height: h * 0.065,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                      ),
                    ),
                    onPressed: () {
                      provider.registerUser(context, provider.nameController.text, provider.emailController.text, provider.passwordController.text);
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: w * 0.045,color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                SizedBox(height: h * 0.03),

                /// Divider text
                Text(
                  '- or sign up with -',
                  style: TextStyle(color: Colors.grey, fontSize: w * 0.045),
                ),

                /// Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: w * 0.045),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: w * 0.035,
                          color: Colors.blue,
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

  /// Reusable widgets
  Widget buildLabel(String text, double w) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          fontSize: w * 0.06,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
    );
  }
  Widget buildTextField(String hint, dynamic controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
    );
  }

}
