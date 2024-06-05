import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_flow_part_1/constants/gaps.dart';
import 'package:onboarding_flow_part_1/constants/sizes.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  bool _showNameCheck = false;
  bool _showEmailCheck = false;
  bool _showDateCheck = false;

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
          initialDateTime: _selectedDate,
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
          'Create your account',
          style: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
