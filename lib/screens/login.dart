import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Food Now",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    right: 50, left: 50, top: 5, bottom: 30),
                child: Text(
                  "Sign in with your email and password or continue with social media",
                  style: TextStyle(),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Your email",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Your password",
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock)),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: true, 
                          onChanged: (bool? value) {}
                        ),
                        Text("Remember me")
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {}, 
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 40),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
