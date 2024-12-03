import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/domain/usecases/auth/is_user_logged_in.dart';
import 'package:spotify_clone/presentation/home/pages/home.dart';

import '../../../service_locator.dart';
import '../../get_started/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(AppVectors.logo),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    var isUserLoggedIn = await sl<IsUserLoggedInUseCase>().call();
    if (isUserLoggedIn) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const GetStartedPage(),
        ),
      );
    }
  }
}
