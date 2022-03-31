import 'package:flutter/material.dart';
import 'package:nda_18dh110793/widgets/Input.dart';

class AccountFragment extends StatefulWidget {
  AccountFragment({Key? key}) : super(key: key);

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 32),
          child: Input(
            hintText: "Enter your email",
            suffixIcon: Icons.email,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Input(
            hintText: "Enter your password",
            suffixIcon: Icons.lock,
            password: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Input(
            hintText: "Re-enter your password",
            suffixIcon: Icons.lock,
            password: true,
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Continue",
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      ?.copyWith(color: Colors.white),
                )))
      ],
    );
  }
}
