import 'package:flutter/material.dart';
import 'package:untitled/components/my_text.dart';
import 'package:untitled/service/shared_prefrence_helper.dart';

import '../components/text_login_field.dart';
import 'home_screen.dart';
class LoginScreen extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xff7cbf86),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
               Align(
                alignment: Alignment.center,
                child: MyText(size: 20,color: Colors.white,isBold: true,text: 'Hello , please login into your email',)
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(right: 10, left: 10),
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    const Image(
                        image: AssetImage('assets/wallet_money.png'),
                        width: 400,
                        height: 250),
                    const SizedBox(
                      height: 20,
                    ),
                    TextLoginField(Icons.email, 'Email', (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!value.endsWith('@gmail.com')){
                        return 'Email must end with @gmail.com';
                      }
                    },emailController
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    TextLoginField(Icons.lock, 'Password',(value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'password must be 8 characters or more';
                      }
                    },passwordController

                    ),

                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color(0xff7cbf86)),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>  HomeScreen(),
                                ));
                            SharedPreferenceHelper.saveData(key: 'Email', value: emailController.text);
                          }
                        },
                        child:MyText(text: 'Login',isBold: true ,color: Colors.white, size: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        MyText(size: 15, color: Colors.black, isBold: true, text: 'you don`t have an account yet ?'),
                        TextButton(
                            onPressed: () {},
                            child:MyText(text: 'Register',color: const Color(0xff7cbf86),size: 15,isBold: true,))
                      ],
                    ),
                    const SizedBox(height: 70,)
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