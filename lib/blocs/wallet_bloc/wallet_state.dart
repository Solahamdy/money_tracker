part of 'wallet_cubit.dart';

@immutable
abstract class WalletState {}

class WalletInitial extends WalletState {}
class AddProductsToContentsState extends WalletState {}
class AlreadySpentState extends WalletState {}
class ListMoneyState extends WalletState {}
