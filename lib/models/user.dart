import 'package:saloon/models/wallet.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.income,
    required this.passcode,
    required this.isPremium,
    required this.wallets,
  }); //
  String username;
  String id;
  String name;
  bool isPremium;
  double income;
  String passcode;
  String email;
  List<Wallet> wallets;
}
