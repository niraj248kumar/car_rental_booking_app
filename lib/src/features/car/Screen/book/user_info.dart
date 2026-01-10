import 'package:car_rental_booking/src/features/car/Screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  String? selectedGender;
  String? selectedState;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("User Info Screen"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          leading: const BackButton(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(16, 16, 16, size.height * 0.12),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your information Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _textField(
                    controller: nameCtrl,
                    label: "Name",
                    hint: "User Name",
                  ),

                  const SizedBox(height: 16),

                  _textField(
                    controller: emailCtrl,
                    label: "User Email",
                    hint: "example@gmail.com",
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16),

                  _dropdownField(
                    label: "Gender",
                    value: selectedGender,
                    items: const ["Male", "Female", "Other"],
                    onChanged: (value) {
                      setState(() => selectedGender = value);
                    },
                  ),

                  const SizedBox(height: 16),

                  _textField(
                    controller: phoneCtrl,
                    label: "Phone Number",
                    hint: "+91  Enter the Phone Number",
                    keyboardType: TextInputType.phone,
                  ),

                  const SizedBox(height: 16),
                  _dropdownField(
                    label: "State",
                    value: selectedState,
                    items: const ["Bihar", "Up", "MP", "Delhi", "Other"],
                    onChanged: (value) {
                      setState(() => selectedState = value);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),

        /// Bottom Button (Responsive)
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Navigate to confirmation page
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  Fluttertoast.showToast(msg: 'Booking Success');
                }
              },
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) =>
          value == null || value.isEmpty ? "Required" : null,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _dropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items
              .map(
                (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
              .toList(),
          onChanged: onChanged,
          validator: (value) =>
          value == null ? "Required" : null,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          ),
        ),
      ],
    );
  }
}
