import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nda_18dh110793/constants/colors.dart';
import 'package:nda_18dh110793/helpers/custom_share_reference.dart';
import 'package:nda_18dh110793/helpers/validate.dart';
import 'package:nda_18dh110793/screens/home_page/home.dart';
import 'package:nda_18dh110793/screens/signup.dart';
import 'package:nda_18dh110793/widgets/Input.dart';
import 'package:nda_18dh110793/widgets/SocialIcon.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  onLogin() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController.text =
        CustomShareReference.get(CustomShareReference.keyUsername) ?? "";
    passwordController.text =
        CustomShareReference.get(CustomShareReference.keyPassword) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Positioned(
                  top: -30,
                  right: -30,
                  child: Image(
                    image: AssetImage("assets/dish.png"),
                  )),
              Positioned(
                  bottom: -30,
                  left: -30,
                  child: Image(
                    image: AssetImage("assets/dish_2.png"),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Food Now",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyColors.PRIMARY_COLOR),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 50, left: 50, top: 5, bottom: 30),
                    child: Text(
                      "Sign in with your email and password or continue with social media",
                      style: TextStyle(color: MyColors.PRIMARY_COLOR),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Input(
                          hintText: "Your email",
                          prefixIcon: Icons.email,
                          validator: (value) {
                            return ValidateInput.validateEmail(value);
                          },
                          controller: usernameController,
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                        Input(
                          hintText: "Your password",
                          prefixIcon: Icons.lock,
                          password: true,
                          validator: (value) {
                            return ValidateInput.validatePassword(value);
                          },
                          controller: passwordController,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                  value: true, onChanged: (bool? value) {}),
                              Text("Remember me")
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            onLogin();
                          },
                          child: Text("Continue"),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialIcon(asset: "assets/icons/facebook-2.svg"),
                      SocialIcon(asset: "assets/icons/google-icon.svg"),
                      SocialIcon(asset: "assets/icons/twitter.svg"),
                    ],
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont't have an account?",
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                          setState(() {});
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
