

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoesphere/ui/responsive/size_config.dart';
import 'package:shoesphere/ui/route/route.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    Timer(const Duration(seconds: 3),()=>Get.toNamed(intro));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Center(
        child: Image.asset('assets/icons/logo.png',width: 50.w,),
      ),
    );
  }
}
