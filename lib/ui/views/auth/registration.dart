import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/ui/responsive/size_config.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/widgets/custom_button.dart';
import 'package:shoesphere/ui/widgets/custom_text_field.dart';

class Registration extends StatelessWidget {
  Registration({super.key});
  TextEditingController _nameControler = TextEditingController();
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();
  RxBool _value = false.obs;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: SizeConfig.screenHeight,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    'assets/icons/logo.png',
                    width: 40.w,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sign Up',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customFormField(
                      TextInputType.text, _nameControler, context, 'Name',
                      (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  }, prefixIcon: Icons.person_2_outlined),
                  customFormField(TextInputType.emailAddress, _emailControler,
                      context, 'Email', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                    if (!val.contains(RegExp(r'\@'))) {
                      return 'enter a valid email address';
                    }
                  }, prefixIcon: Icons.email_outlined),
                  customFormField(TextInputType.text, _passwordControler,
                      context, 'Password', (val) {
                    if (val.isEmpty) {
                      return 'this field can\'t be empty';
                    }
                  },
                      prefixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                            value: _value.value,
                            onChanged: (val) {
                              _value.value = val!;
                            }),),

                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'I accept all the Terms & Condition',
                            style: TextStyle(color: AppColors.vampireBlackColor)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed(terms),
                            text: '  ',
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w600)),
                      ]))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Sign Up',
                        () {
                          if (_formKey.currentState!.validate() && _value.value==true) {
                            print('Succcess');
                          } else {
                            print('Failed');
                          }
                        },
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text('  OR  '),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Ink(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grayColor.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/icons/facebook.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () {},
                        child: Ink(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: AppColors.grayColor.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/icons/search.png'),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                        text: 'Already have an account?',
                        style: TextStyle(color: AppColors.grayColor)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(login),
                        text: ' Log In',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ]))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
