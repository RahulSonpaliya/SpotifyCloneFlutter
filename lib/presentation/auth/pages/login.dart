import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:spotify_clone/common/widgets/app_bar/basic_app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_app_button.dart';
import 'package:spotify_clone/data/models/auth/signin_user_req.dart';
import 'package:spotify_clone/domain/usecases/auth/signin.dart';

import '../../../service_locator.dart';
import '../../home/pages/home.dart';
import 'signup.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: Scaffold(
        appBar: const BasicAppBar(
          showLogo: true,
          showBackButton: true,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Not A Member?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SignUpPage(),
                    ),
                  );
                },
                child: const Text(
                  'Register Now',
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 30,
          ),
          child: Column(
            children: [
              const Text(
                'Sign In',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter Email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordCtrl,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              BasicAppButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    context.loaderOverlay.show();
                    var result = await sl<SignInUseCase>().call(
                        param: SignInUserReq(
                      email: _emailCtrl.text,
                      password: _passwordCtrl.text,
                    ));
                    context.loaderOverlay.hide();
                    result.fold(
                      (failure) {
                        var snackBar = SnackBar(
                          content: Text(failure.message),
                          behavior: SnackBarBehavior.floating,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      (signInResponse) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const HomePage()),
                            (route) => false);
                      },
                    );
                  }
                },
                title: 'Sign In',
              )
            ],
          ),
        ),
      ),
    );
  }
}
