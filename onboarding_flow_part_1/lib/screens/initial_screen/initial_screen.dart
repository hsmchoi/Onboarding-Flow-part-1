import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_flow_part_1/constants/gaps.dart';
import 'package:onboarding_flow_part_1/screens/CreateAccountScreen/Create_Account_Screen.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  void _onCreateAccountTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const CreateAccountScreen(isSwitchOn: false),
      ),
    );
  }

  // void _onLoginTap(BuildContext context) {
  //   // 로그인 페이지로 이동하는 로직 구현
  //   // ...
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('asset/twitter_logo.png')),
            Gaps.v52,
            const Text(
              'See what\'s happening in the world right now.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Gaps.v52,
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                minimumSize: const Size(350, 50),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    image: AssetImage('asset/google_logo.png'),
                  ),
                  Gaps.h10,
                  Text('Continue with Google'),
                ],
              ),
            ),
            Gaps.v16,
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: const Size(350, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.apple, color: Color.fromARGB(255, 0, 0, 0)),
                    Gaps.h10,
                    Text('Continue with Apple'),
                  ],
                ),
              ),
            ),
            Gaps.v16,
            const Text(
              'or',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Gaps.v16,
            SizedBox(
              width: 350,
              child: ElevatedButton(
                onPressed: () => _onCreateAccountTap(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Create account',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Gaps.v16,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                children: [
                  const TextSpan(text: 'By signing up, you agree to our '),
                  TextSpan(
                    text: 'Terms',
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Terms of Service 링크 연결
                      },
                  ),
                  const TextSpan(text: ', '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Privacy Policy 링크 연결
                      },
                  ),
                  const TextSpan(text: ', and '),
                  TextSpan(
                    text: 'Cookie Use',
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Cookie Use 링크 연결
                      },
                  ),
                  const TextSpan(text: '.'),
                ],
              ),
            ),
            Gaps.v10,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                children: [
                  const TextSpan(text: 'Have an account already? '),
                  TextSpan(
                    text: 'Log in',
                    style:
                        const TextStyle(decoration: TextDecoration.underline),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Log in 링크 연결
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
