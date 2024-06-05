import 'package:flutter/material.dart';
import 'package:onboarding_flow_part_1/constants/sizes.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Column(children: [Text("See what's happening in the world right now.",style: TextStyle(fontSize: Sizes.size24,)
      ,
      ),
      
      ],
      
      ),
      
      ),
      
      );
  }
}