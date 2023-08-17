import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/common/utils/colors.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = '/login-screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phoneController = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
  }

  void pickCountry() {
    showCountryPicker(
        context: context,
        onSelect: (Country _country) {
          setState(() {
            country = _country;
          });
        });
  }

  void sendPhoneNumber() {
    String phoneNumber = phoneController.text.trim();
    String pattern =
        r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\/0-9]*$'; //r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);

    if (country == null || phoneNumber.isEmpty || phoneNumber.length < 10) {
      showSnackBar(
          context: context, content: 'Fill out all the fields correct');
    } else if (!regExp.hasMatch('+${country!.phoneCode}$phoneNumber')) {
      showSnackBar(context: context, content: 'Enter Correct Phone Number');
    } else {
      ref
          .read(authControllerProvider)
          .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    }

    // if (country != null && phoneNumber.isNotEmpty && phoneNumber.length == 10 ) {
    //   ref
    //       .read(authControllerProvider)
    //       .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
    // } else {
    //   showSnackBar(context: context, content: 'Fill out all the fields');
    // }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter your phone number',
          style: TextStyle(fontFamily: 'Merienda'),
        ),
        elevation: 0,
        backgroundColor: tabColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'chatti will need to verify your phone number.',
                  style: TextStyle(
                      wordSpacing: 1.85,
                      fontFamily: fontText,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: pickCountry,
                  child: const Text(
                    'Pick Country',
                    style: TextStyle(
                        wordSpacing: 1.85,
                        fontFamily: fontText,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    if (country != null)
                      Text(
                        '+${country!.phoneCode}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: size.width * 0.7,
                      child: TextField(
                        cursorHeight: 100,
                        cursorColor: appBarColor,
                        maxLength: 10,
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: appBarColor,
                              width: 2.0,
                            ),
                          ),
                          focusColor: appBarColor,
                          fillColor: appBarColor,
                          hintText: 'Enter the phone number',
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                          // hintText: 'Enter Your Name',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.5),
                SizedBox(
                  width: 90,
                  child: CustomButton(
                    onPressed: sendPhoneNumber,
                    text: 'NEXT',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
