import 'package:flutter/material.dart';
import 'package:nda_18dh110793/helpers/custom_share_reference.dart';
import 'package:nda_18dh110793/widgets/Input.dart';

import '../../../constants/colors.dart';

class AccountFragment extends StatefulWidget {
  AccountFragment({Key? key}) : super(key: key);

  @override
  State<AccountFragment> createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text =
        CustomShareReference.get(CustomShareReference.keyUsername);
    _passwordController.text =
        CustomShareReference.get(CustomShareReference.keyPassword);
    _fullNameController.text =
        CustomShareReference.get(CustomShareReference.keyFullName);
    _addressController.text =
        CustomShareReference.get(CustomShareReference.keyAddress);
    _phoneController.text =
        CustomShareReference.get(CustomShareReference.keyPhone);
  }

  onSave() async {
    if (_formKey.currentState!.validate()) {
      await CustomShareReference.setTextField(
          CustomShareReference.keyFullName, _fullNameController);
      await CustomShareReference.setTextField(
          CustomShareReference.keyAddress, _addressController);
      await CustomShareReference.setTextField(
          CustomShareReference.keyPhone, _phoneController);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        elevation: 0,
        backgroundColor: MyColors.PRIMARY_COLOR,
        title: Text("Account Info"),
        leading: Container(),
      ),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        sliver: SliverToBoxAdapter(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 32),
                  child: Input(
                    controller: _fullNameController,
                    hintText: "Full name",
                    suffixIcon: Icons.account_box,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Full name can not empty";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Input(
                    controller: _emailController,
                    hintText: "Enter your email",
                    readyOnly: true,
                    suffixIcon: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email can not empty";
                      }

                      return null;
                    },
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password can not empty";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Input(
                    controller: _addressController,
                    hintText: "Address",
                    suffixIcon: Icons.home,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Address can not empty";
                      }

                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Input(
                    controller: _phoneController,
                    hintText: "Phone",
                    suffixIcon: Icons.phone,
                    type: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Phone number can not empty";
                      }

                      return null;
                    },
                  ),
                ),
                SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: onSave,
                        child: Text(
                          "Save",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(color: Colors.white),
                        )))
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}
