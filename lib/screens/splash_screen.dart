import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/components/my_text.dart';
import 'package:untitled/screens/home_screen.dart';
import '../../../core/size_config.dart';
import '../service/shared_prefrence_helper.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
            () => route()
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return  Scaffold(backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(
          children: [
            const Expanded(child: Center(
              child: Image(image: AssetImage('assets/money-bag.png'),height: 180,width: 180,),
            )),
            MyText(size: 25, color: const Color(0xff7cbf86), isBold: true, text: 'Welcome to your Money tracker ! ')
          ],
        ),
      ),
    );
  }

  dynamic route(){
    if(SharedPreferenceHelper.getData(key: "Email") == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
    else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  HomeScreen(),
        ),
      );
    }


  }

}