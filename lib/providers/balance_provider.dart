import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokped/models/balance.dart';

class BalanceProvider extends ChangeNotifier {
  Future<List<Balance>?> getBalance() async {
    Uri url = Uri.parse(
        'https://cbe8a924-9842-4053-9415-7bfd6c06d1dc.mock.pstmn.io/balance');

    try {
      var result = await http.get(url);

      print(result.statusCode);
      print(result.body);
      if (result.statusCode == 200) {
        List<Balance> _balance = balanceFromJson(result.body);
        return _balance;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
