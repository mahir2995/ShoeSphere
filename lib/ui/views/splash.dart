

//import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:get/get.dart';
import 'package:shoesphere/ui/responsive/size_config.dart';
//import 'package:shoesphere/ui/route/route.dart';

class Splash extends StatelessWidget {


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
