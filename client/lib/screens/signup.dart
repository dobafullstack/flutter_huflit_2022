import 'package:flutter/material.dart';
import 'package:nda_18dh110793/constants/colors.dart';
import 'package:nda_18dh110793/helpers/user_share_reference.dart';
import 'package:nda_18dh110793/helpers/validate.dart';
import 'package:nda_18dh110793/widgets/Input.dart';

import '../widgets/SocialIcon.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    UserShareReference.init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: MyColors.PRIMARY_COLOR),
        titleTextStyle: TextStyle(
            color: MyColors.PRIMARY_COLOR,
            fontSize: 30,
            fontWeight: FontWeight.bold),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          padding: EdgeInsets.symmetric(horizontal: 16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register Account",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: MyColors.PRIMARY_COLOR),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 50, left: 50, top: 5, bottom: 30),
                child: Text(
                  "Continue with your detail or continue with social media",
                  style: TextStyle(color: MyColors.PRIMARY_COLOR),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Input(
                        hintText: "Enter your email",
                        suffixIcon: Icons.email,
                        validator: (value) {
                          return ValidateInput.validateEmail(value);
                        },
                        controller: usernameController,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Input(
                        hintText: "Enter your password",
                        suffixIcon: Icons.lock,
                        password: true,
                        validator: (value) {
                          return ValidateInput.validatePassword(value);
                        },
                        controller: passwordController,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      Input(
                        hintText: "Re-enter your password",
                        suffixIcon: Icons.lock,
                        password: true,
                        validator: (value) {
                          return ValidateInput.validatePassword(value);
                        },
                        controller: confirmPasswordController,
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 20)),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await UserShareReference.setUsername(usernameController.text);
                            await UserShareReference.setPassword(passwordController.text);

                            Navigator.pop(context);
                          }
                        },
                        child: Text("Continue"),
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(asset: "assets/icons/facebook-2.svg"),
                  SocialIcon(asset: "assets/icons/google-icon.svg"),
                  SocialIcon(asset: "assets/icons/twitter.svg"),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
