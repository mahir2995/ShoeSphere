/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/auth_controller.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/ui/responsive/size_config.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/widgets/custom_button.dart';
import 'package:shoesphere/ui/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                    SizedBox(height: 30),
                    Image.asset(
                      'assets/icons/logo.png',
                      width: 40.w,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Log In',
                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 20),
                    customFormField(
                      TextInputType.emailAddress,
                      _emailController,
                      context,
                      'Email',
                          (val) {
                        if (val.isEmpty) {
                          return 'this field can\'t be empty';
                        }
                        if (!val.contains(RegExp(r'\@'))) {
                          return 'enter a valid email address';
                        }
                      },
                      prefixIcon: Icons.email_outlined,
                    ),
                    customFormField(
                      TextInputType.text,
                      _passwordController,
                      context,
                      'Password',
                          (val) {
                        if (val.isEmpty) {
                          return 'this field can\'t be empty';
                        }
                      },
                      prefixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.toNamed(forgetPass),
                        child: Text(
                          'Forget Password',
                          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Log in',
                            () {
                          if (_formKey.currentState!.validate()) {
                            Get.find<AuthController>().login(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            );
                          } else {
                            print('Failed');
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            _launchURL('https://www.facebook.com');
                          },
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
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset('assets/icons/facebook.png'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
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
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset('assets/icons/search.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(color: AppColors.grayColor),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed(registration),
                            text: ' Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

 */



 //perfect code with fb and google
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/auth_controller.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/ui/responsive/size_config.dart';
import 'package:shoesphere/ui/route/route.dart';

import 'package:shoesphere/ui/widgets/custom_button.dart';
import 'package:shoesphere/ui/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _handleGoogleLogin() async {
    Get.find<AuthController>().signInWithGoogle();
  }

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
                    SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        'assets/icons/logo.png',
                        width: 40.w,
                      ),
                    ),
                    SizedBox(height: 10
                    ),
                    Text(
                        'Log In',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                    SizedBox(height: 20),

                      customFormField(
                        TextInputType.emailAddress,
                        _emailController,
                        context,
                        'Email',
                            (val) {
                          if (val == null || val.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          if (!val.contains(RegExp(r'\@'))) {
                            return 'enter a valid email address';
                          }
                          return null;
                        },
                        prefixIcon: Icons.email_outlined,
                      ),

                    customFormField(
                        TextInputType.text,
                        _passwordController,
                        context,
                        'Password',
                            (val) {
                          if (val == null || val.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                        prefixIcon: Icons.remove_red_eye_outlined,
                        obscureText: true,
                      ),


                    //
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.toNamed(forgetPass),
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    //
                    SizedBox(height: 30),
                    //
                    SizedBox(
                        width: 200,
                        height: 45,
                        child: customButton(
                          'Log in',
                              () {
                            if (_formKey.currentState!.validate()) {
                              Get.find<AuthController>().login(
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  context);
                            } else {
                              print('failed');
                            }
                          },
                        )),
                    //
                    SizedBox(height: 20),
                    //
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
                    //
                    SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => _launchURL('https://www.facebook.com'),
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
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset('assets/icons/facebook.png'),
                                ),
                              ),
                            ),

                          SizedBox(width: 20),
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: _handleGoogleLogin,
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
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset('assets/icons/search.png'),
                                ),
                              ),
                            ),

                        ],
                      ),

                    //
                    SizedBox(height: 30),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(color: AppColors.grayColor)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(registration),
                          text: ' Sign Up',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600)),
                    ]))
                    //
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


/*
//only google

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesphere/business_logics/controllers/auth_controller.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/ui/responsive/size_config.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/widgets/custom_button.dart';
import 'package:shoesphere/ui/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _handleGoogleLogin() async {
    Get.find<AuthController>().signInWithGoogle();
  }

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
                    SizedBox(height: 30),
                    Center(
                      child: Image.asset(
                        'assets/icons/logo.png',
                        width: 40.w,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Log In',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 20),
                    customFormField(
                      TextInputType.emailAddress,
                      _emailController,
                      context,
                      'Email',
                          (val) {
                        if (val == null || val.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        if (!val.contains(RegExp(r'\@'))) {
                          return 'enter a valid email address';
                        }
                        return null;
                      },
                      prefixIcon: Icons.email_outlined,
                    ),
                    customFormField(
                      TextInputType.text,
                      _passwordController,
                      context,
                      'Password',
                          (val) {
                        if (val == null || val.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                      prefixIcon: Icons.remove_red_eye_outlined,
                      obscureText: true,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => Get.toNamed(forgetPass),
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Log in',
                            () {
                          if (_formKey.currentState!.validate()) {
                            Get.find<AuthController>().login(
                              _emailController.text.trim(),
                              _passwordController.text.trim(),
                              context,
                            );
                          } else {
                            print('failed');
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Center(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: _handleGoogleLogin,
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
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset('assets/icons/search.png'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(color: AppColors.grayColor),
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed(registration),
                            text: ' Sign Up',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



*/

