import 'package:saloon/models/wallet.dart';

class User {
  String username;
  String id;
  String name;
  bool isPremium;
  String passcode;
  String email;
  List<Wallet> wallets;
  User({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.passcode,
    this.isPremium = false,
    required this.wallets,
  });
}
