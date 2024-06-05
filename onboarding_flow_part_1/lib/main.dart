import 'package:flutter/material.dart';
import 'package:onboarding_flow_part_1/screens/initial_screen/initial_screen.dart';

void main() {
  runApp(const Onboardingflowpart1());
}

class Onboardingflowpart1 extends StatelessWidget {
  const Onboardingflowpart1({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onboardingflowpart1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        cardColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const InitialScreen(),
    );
  }
}
