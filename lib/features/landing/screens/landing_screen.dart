import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_ui/common/widgets/custom_button.dart';
import 'package:whatsapp_ui/common/widgets/gradient_text.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              GradientText(
                text: 'Welcome to chatti',
                style: const TextStyle(fontSize: 40),
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 12, 46, 76),
                  const Color.fromARGB(255, 8, 28, 46),
                  Colors.blue.shade900,
                ]),
              ),
              // const Text(
              //   'Welcome to chatti',
              //   style: TextStyle(
              //       decoration: TextDecoration.underline,
              //       decorationStyle: TextDecorationStyle.dashed,
              //       fontSize: 33,
              //       fontWeight: FontWeight.w600,
              //       fontFamily: 'Oooh Baby'),
              // ),
              SizedBox(height: size.height / 13.3),
              const Text(
                'TEAM MEMBERS',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Merienda'),
              ),
              const SizedBox(height: 15),

              const Text(
                'Munivel P',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.3,
                    fontFamily: 'Alegreya SC'),
              ),
              const SizedBox(height: 6.2),
              const Text(
                'Kalaikovan P',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.3,
                    fontFamily: 'Alegreya SC'),
              ),
              const SizedBox(height: 6.2),
              // const Text(
              //   'Mouleeshwaran B',
              //   style: TextStyle(
              //       fontSize: 25,
              //       fontWeight: FontWeight.w600,
              //       letterSpacing: 2.3,
              //       fontFamily: 'Alegreya SC'),
              // ),
              // const SizedBox(height: 6.2),

              // const Text(
              //   'Nareshkumar A',
              //   style: TextStyle(
              //       fontSize: 25,
              //       fontWeight: FontWeight.w600,
              //       letterSpacing: 2.3,
              //       fontFamily: 'Alegreya SC'),
              // ),
              const SizedBox(height: 6.2),
              // Image.asset(
              //   'assets/bg.png',
              //   height: 340,
              //   width: 340,
              //   color: tabColor,
              // ),
              SizedBox(height: size.height / 9),
              const SizedBox(
                height: 130,
              ),

              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Alegreya SC',
                      fontSize: 19),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 3),
              // Ink(
              //   decoration: BoxDecoration(
              //       gradient: const LinearGradient(colors: [
              //         Color.fromARGB(255, 25, 122, 241),
              //         Color.fromARGB(255, 29, 91, 120),
              //         Color.fromARGB(255, 241, 25, 25),
              //       ]),
              //       borderRadius: BorderRadius.circular(20)),
              //   child: Container(
              //     width: 250,
              //     height: 50,
              //     alignment: Alignment.center,
              //     child: const Text(
              //       'Button',
              //       style: const TextStyle(
              //           fontSize: 24, fontStyle: FontStyle.italic),
              //     ),
              //   ),
              // ),

              SizedBox(
                width: size.width * 0.75,
                child: CustomButton(
                  text: 'AGREE AND CONTINUE',
                  onPressed: () => navigateToLoginScreen(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
