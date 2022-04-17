import 'package:flutter/material.dart';
import 'package:nda_18dh110793/helpers/custom_share_reference.dart';
import 'package:nda_18dh110793/widgets/Input.dart';

class AccountFragment extends StatefulWidget {
  AccountFragment({Key? key}) : super(key: key);

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text =
        CustomShareReference.get(CustomShareReference.keyUsername) ?? "";
    _passwordController.text =
        CustomShareReference.get(CustomShareReference.keyPassword) ?? "";
    _fullNameController.text =
        CustomShareReference.get(CustomShareReference.keyFullName) ?? "";
    _addressController.text =
        CustomShareReference.get(CustomShareReference.keyAddress) ?? "";
    _phoneController.text =
        CustomShareReference.get(CustomShareReference.keyPhone) ?? "";
  }

  onSave() async {
    await CustomShareReference.setTextField(
        CustomShareReference.keyUsername, _emailController);
    await CustomShareReference.setTextField(
        CustomShareReference.keyPassword, _passwordController);
    await CustomShareReference.setTextField(
        CustomShareReference.keyFullName, _fullNameController);
    await CustomShareReference.setTextField(
        CustomShareReference.keyAddress, _addressController);
    await CustomShareReference.setTextField(
        CustomShareReference.keyPhone, _phoneController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16, top: 32),
          child: Input(
            controller: _fullNameController,
            hintText: "Full name",
            suffixIcon: Icons.account_box,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Input(
            controller: _emailController,
            hintText: "Enter your email",
            readyOnly: true,
            suffixIcon: Icons.email,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Input(
            controller: _passwordController,
            hintText: "Enter your password",
            readyOnly: true,
            suffixIcon: Icons.lock,
            password: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Input(
            controller: _addressController,
            hintText: "Address",
            suffixIcon: Icons.home,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Input(
            controller: _phoneController,
            hintText: "Phone",
            suffixIcon: Icons.phone,
            type: TextInputType.phone,
          ),
        ),
        SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
                onPressed: onSave,
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
