import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onboarding_flow_part_1/constants/gaps.dart';
import 'package:onboarding_flow_part_1/constants/sizes.dart';
import 'package:onboarding_flow_part_1/screens/CustomizeExperienceScreen.dart';

class CreateAccountScreen extends StatefulWidget {
  final bool isSwitchOn;
  const CreateAccountScreen({super.key, required this.isSwitchOn});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final String sub =
      "By signing up, you agree to the Terms of Service and Privacy Policy, including Cookie Use. Twitter may use your contact information, including your email address and phone number for purposes outlined in our Privacy Policy, like keeping your account secure and personalizing our services, including ads. Learn more. Others will be able to find you by email or phone number, when provided,unless you choose otherwise here.";

  bool _showNameCheck = false;
  bool _showEmailCheck = false;
  bool _showDateCheck = false;
  @override
  void didUpdateWidget(covariant CreateAccountScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isSwitchOn != oldWidget.isSwitchOn) {
      setState(() {}); // 상태 변경 시 UI 업데이트
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: _selectedDate, // _selectedDate 변수 사용
          maximumDate: DateTime.now(),
          onDateTimeChanged: (DateTime newDate) {
            setState(() {
              _selectedDate = newDate;
              _showDateCheck = true; // 날짜 선택 시 체크 아이콘 표시
            });
          },
        ),
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      // 다음 페이지로 이동하는 로직 (Navigator.push)

      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CustomizeExperienceScreen(
                  isSwitchOn:
                      widget.isSwitchOn, // _switchValue 대신 widget.isSwitchOn 사용
                )),
      );
    }
  }

  String formatTime(int time) {
    int hours = time ~/ 60;
    int minutes = time % 60;
    return '${hours}h ${minutes}min';
  }

  String joinGenres(List genres) {
    return genres.map((genre) => genre['name'].toString()).toList().join(', ');
  }

  List<bool> convertScoreToArray(double score) {
    int halfScore = (score / 2).round();
    return List.generate(5, (index) => index < halfScore ? true : false)
        .toList();
  }

  List<Widget> buildStarIcons(List<bool> scores) {
    return scores.map((star) {
      return star
          ? const Icon(
              Icons.star,
              color: Colors.yellow,
            )
          : const Icon(
              Icons.star,
              color: Colors.white54,
            );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: TextButton(
          // SizedBox 제거
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
          'Create your account',
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size28,
            fontWeight: FontWeight.w800,
          ),
        ),
        flexibleSpace: const Align(
          alignment: Alignment.center,
          child: Image(
            image: AssetImage('asset/twitter_logo.png'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v28,
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  suffixIcon: _showNameCheck
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _showNameCheck = false;
                    });
                    return null;
                  } else {
                    setState(() {
                      _showNameCheck = true;
                    });
                    return null;
                  }
                },
              ),
              Gaps.v16,
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Phone number or email address',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                  ),
                  suffixIcon: _showEmailCheck
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    setState(() {
                      _showEmailCheck = false;
                    });
                    return null;
                  } else if (!value.contains('@')) {
                    setState(() {
                      _showEmailCheck = false;
                    });
                    return null;
                  } else {
                    setState(() {
                      _showEmailCheck = true;
                    });
                    return null;
                  }
                },
              ),
              Gaps.v16,
              GestureDetector(
                onTap: () {
                  _showCupertinoDatePicker(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    controller: TextEditingController(
                        text: _selectedDate.toString().split(' ')[0]),
                    decoration: InputDecoration(
                      hintText: 'Date of birth',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      suffixIcon: _showDateCheck
                          ? const Icon(Icons.check, color: Colors.green)
                          : null,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        setState(() {
                          _showDateCheck = false;
                        });
                        return null;
                      } else {
                        setState(() {
                          _showDateCheck = true;
                        });
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Gaps.v28,
              Text(
                widget.isSwitchOn
                    ? ''
                    : 'This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.',
                style: const TextStyle(
                  fontSize: Sizes.size12,
                ),
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.size20),
                  decoration: BoxDecoration(
                    color: (_showNameCheck && _showEmailCheck && _showDateCheck)
                        ? Colors.black
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(Sizes.size5),
                  ),
                  child: Text(
                    widget.isSwitchOn ? 'Sign up' : 'Next',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Text(
                widget.isSwitchOn ? sub : '',
                style: const TextStyle(
                  fontSize: Sizes.size12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
