import 'package:cuidapet/app/core/ui/extensions/screen_size_extension.dart';
import 'package:cuidapet/app/core/ui/extensions/theme_extension.dart';
import 'package:cuidapet/app/core/ui/icons/cuidapet_icons.dart';
import 'package:cuidapet/app/core/ui/widgets/button.dart';
import 'package:cuidapet/app/core/ui/widgets/cuidapet_textform_field.dart';
import 'package:cuidapet/app/core/ui/widgets/rounded_icon_button.dart';
import 'package:flutter/material.dart';
part 'widgets/login_form.dart';
part 'widgets/register_buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(children: [
            SizedBox(height: 50.h),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 162.w,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const _LoginForm(),
            const _OrSeparator(),
            const _RegisterButtons(),
          ]),
        ),
      ),
    );
  }
}

class _OrSeparator extends StatelessWidget {
  const _OrSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 1,
              color: context.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'ou',
              style: TextStyle(
                color: context.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 1,
              color: context.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
