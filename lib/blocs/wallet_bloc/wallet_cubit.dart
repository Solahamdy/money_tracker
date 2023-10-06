import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/screens/home_screen.dart';
import '../../models/contents_model.dart';
import '../../screens/login_screen.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  static WalletCubit get(context) => BlocProvider.of(context);
  List <ContentsModel> contents = [
    ContentsModel(image: 'assets/vegetables.png',product:'Vegetables',price: 8.99, ),
    ContentsModel(image: 'assets/petShopColored.png' , product: 'Pet shop', price: 12.45,  ),
    ContentsModel(image: 'assets/pharmacyColored.png', product: 'Pharmacy', price: 2.23, ),
    ContentsModel(image: 'assets/electricityColored (2).png', product: 'Electricity', price: 7.59,),
    ContentsModel(image: 'assets/bakeryColored.png', product: 'Bakery', price: 6.37, ),
    ContentsModel(image: 'assets/collegeColored.png', product: 'College', price: 4.25, ),
    ContentsModel(image: 'assets/cakesColored.png', product: 'Cakes', price: 20.11, ),
    ContentsModel(image: 'assets/publicTransport.png', product: 'Public Transport', price: 3.18, )
  ];

dynamic addProductsToContents(String product ,double price , String image){
  contents.add(ContentsModel(image: image, product: product, price: price));
  emit(AddProductsToContentsState());

}

 double balance = 2000;

 double sum = 0;
 void alreadySpentMoney(){
   for (var money in contents){
     sum += money.price ;
   }
   emit(AlreadySpentState());
}

}






