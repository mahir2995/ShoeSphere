import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesphere/const/app_colors.dart';
import 'package:shoesphere/ui/responsive/size_config.dart';
import 'package:shoesphere/ui/route/route.dart';
import 'package:shoesphere/ui/widgets/custom_button.dart';
import 'package:shoesphere/ui/widgets/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();

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
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  SizedBox(height: 30,),
                  Image.asset(
                    'assets/icons/logo.png',
                    width: 40.w,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Log In',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 20,),
                  customFormField(TextInputType.emailAddress, _emailControler,
                      context, 'Email', (val) {},
                      prefixIcon: Icons.email_outlined),
                  customFormField(TextInputType.text, _passwordControler, context,
                      'Password', (val) {},
                      prefixIcon: Icons.remove_red_eye_outlined, obscureText: true),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () => Get.toNamed(forgetPass),
                      child: Text(
                        'Forget Password',
                        style:
                            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Log in',
                        () {},
                      )),
                  SizedBox(height: 30,),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                      Text('  Or  '),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
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
                  SizedBox(height: 70,),
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
                ],
              ),
            ),
                    ),
                  ),
          ),
    );
  }
}
