import 'package:flutter/material.dart';
import 'package:onboarding_flow_part_1/constants/gaps.dart';
import 'package:onboarding_flow_part_1/constants/sizes.dart';

class CustomizeExperienceScreen extends StatefulWidget {
  const CustomizeExperienceScreen({super.key});

  @override
  State<CustomizeExperienceScreen> createState() =>
      _CustomizeExperienceScreenState();
}

class _CustomizeExperienceScreenState extends State<CustomizeExperienceScreen> {
  bool _switchValue = false;

  void _onSubmit() {
    if (_switchValue) {
      // 다음 페이지로 이동하는 로직 (Navigator.push)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16,
            ),
          ),
        ),
        title: const Text(
          'Customize your experience',
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              'Track where you see Twitter content across the web',
              style: TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v10,
            const Text(
              'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
              style: TextStyle(
                fontSize: Sizes.size14,
                // color: Colors.grey.shade600,
              ),
            ),
            Gaps.v28,
            Row(
              children: [
                Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
                Gaps.h5,
                const Expanded(
                  child: Text(
                    'Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.',
                    style: TextStyle(
                      fontSize: Sizes.size14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Gaps.v28,
            GestureDetector(
              onTap: _onSubmit,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
                decoration: BoxDecoration(
                  color: _switchValue ? Colors.black : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(Sizes.size5),
                ),
                child: const Text(
                  'Next',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
