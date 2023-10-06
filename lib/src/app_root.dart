import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/blocs/wallet_bloc/wallet_cubit.dart';
import 'package:untitled/screens/saved_money_screen.dart';
import 'package:untitled/screens/splash_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
class AppRoot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return  MultiBlocProvider(
     providers: [
       BlocProvider(create: (BuildContext context) => WalletCubit())
     ],
     child: const MaterialApp(
       home: SplashScreen(),
     ),
   );
  }

}