import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
// loading
  progressDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/files/loading.gif',
              height: 150,
            ),
          );
        });
  }

// failed snackbar
  GetSnackBar failedSnacBar(message)=> GetSnackBar(
    message: message,
    backgroundColor: Colors.redAccent,
    duration: const Duration(seconds: 2),
    icon: const Icon(Icons.warning),
  );

//success snackbar
  GetSnackBar successSnacBar(message)=> GetSnackBar(
    message: message,
    backgroundColor: Colors.greenAccent,
    duration: const Duration(seconds: 2),
    icon: const Icon(Icons.assignment_turned_in),
  );



}
