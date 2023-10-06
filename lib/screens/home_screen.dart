import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/blocs/wallet_bloc/wallet_cubit.dart';
import 'package:untitled/components/add_to_contents.dart';
import 'package:untitled/components/contents_row.dart';
import 'package:untitled/components/custom_button.dart';
import 'package:untitled/components/my_text.dart';
import 'package:untitled/screens/saved_money_screen.dart';
import 'package:untitled/service/shared_prefrence_helper.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {


   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var productController = TextEditingController();
  var priceController = TextEditingController();
  var imageController = TextEditingController();

  final ImagePicker _imagePicker = ImagePicker();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<WalletCubit, WalletState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit = WalletCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        MyText(
                            size: 25,
                            color: Colors.black,
                            isBold: true,
                            text: "Hi Salma"),
                        const Spacer(),
                        const FaIcon(FontAwesomeIcons.sliders,
                            size: 20, color: Colors.black),
                        const SizedBox(
                          width: 20,
                        ),
                        const FaIcon(FontAwesomeIcons.ellipsisVertical,
                            size: 20, color: Colors.black),
                        const SizedBox(
                          width: 20,
                        ),
                         IconButton(onPressed: (){
                           SharedPreferenceHelper.removeData(key: 'Email');
                           Navigator.pushAndRemoveUntil(
                             context,
                             MaterialPageRoute(
                               builder: (context) => LoginScreen(),
                             ),(route) => false,
                           );
                           cubit.sum = SharedPreferenceHelper.getData(key: 'spent');
                         }, icon: const Icon(Icons.logout,color: Colors.black,size: 30,)
                          ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyText(
                        size: 25,
                        color: Colors.black,
                        isBold: true,
                        text: 'You`ve already spent'),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff7cbf86),width: 2),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,right: 22,top: 10,bottom: 10),
                            child: Row(
                              children: [
                                const Image(
                                    image:
                                        AssetImage('assets/money-with-wings.png')),
                                MyText(
                                    size: 25,
                                    color: Colors.black,
                                    isBold: true,
                                    text: cubit.sum.toStringAsFixed(4)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 20,),
                        Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff7cbf86),width: 2),
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: MyText(
                                size: 25,
                                color: Colors.black,
                                isBold: true,
                                text: cubit.balance.toString()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MyText(
                        size: 15,
                        color: const Color(0xffabacb0),
                        isBold: false,
                        text: 'and there`s still 18 days left until payday'),
                    const SizedBox(
                      height: 20,
                    ),
                    AddToContents(text: 'product',controller:  productController),
                    const SizedBox(
                      height: 10,
                    ),
                    AddToContents(text: 'price',controller: priceController),
                    const SizedBox(
                      height: 10,
                    ),
                    AddToContents(text: 'image link',controller: imageController),
                    const SizedBox(
                      height: 10,
                    ),
                   CustomButton(text: 'Add',width: double.infinity,
                       func:(){
                     cubit.addProductsToContents(productController.text, double.parse(priceController.text),imageController.text);
                     cubit.sum += num.parse(priceController.text);
                     SharedPreferenceHelper.saveData(key: 'spent', value: cubit.sum);



                   } ),
                    const SizedBox(
                      height: 15,
                    ),
                    MyText(
                        size: 20,
                        color: Colors.black,
                        isBold: true,
                        text: 'Resent Transactions'),
                    const SizedBox(
                      height: 10,
                    ),
                   SizedBox(
                     height: 250,
                     width: double.infinity,
                     child: ListView.builder(
                       itemCount: cubit.contents.length,
                       shrinkWrap: true,
                       physics: const BouncingScrollPhysics(),
                       scrollDirection: Axis.vertical,
                       itemBuilder: (context, index) {
                       return ContentsRow(
                           image: cubit.contents[index].image,
                           product:cubit.contents[index].product,
                           price: cubit.contents[index].price,

                       );
                     },),
                   ),
                    const SizedBox(height: 15,),
                    CustomButton(text: 'Next',width: double.infinity,func: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SavedMoneyScreen(balance:cubit.balance, used: cubit.sum)));
                    }),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
