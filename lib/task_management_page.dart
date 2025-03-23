import 'package:flutter/material.dart';

class TaskManagementPage extends StatelessWidget {
  final Function onBackPressed; // تابع برای بازگشت به صفحه قبلی

  // سازنده کلاس که پارامتر onBackPressed را دریافت می‌کند
  TaskManagementPage({required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مدیریت کارها'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => onBackPressed(), // فراخوانی تابع بازگشت
        ),
      ),
      body: Center(
        child: Text('این صفحه مدیریت کارها است'),
      ),
    );
  }
}
