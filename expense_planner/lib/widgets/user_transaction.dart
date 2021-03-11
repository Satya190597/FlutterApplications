import 'package:flutter/material.dart';

import 'transaction_list.dart';
import 'new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {

  @override
  UserTransactionState createState() {
    return UserTransactionState();
  }
}

class UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactionList = [
    Transaction(
        id: 'TR1',
        title: 'Bought A T-shirt',
        amount: 99.00,
        date: DateTime.now()),
    Transaction(
        id: 'TR2',
        title: 'Bought A Notebook',
        amount: 10.00,
        date: DateTime.now()),
  ];

  // Private method to add new transaction.
  void _addNewTransaction(String title,double amount) {
      final newTransaction = Transaction(id: DateTime.now().toString(), title: title, amount: amount, date: DateTime.now());
      setState(() {
        _userTransactionList.add(newTransaction);
      });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(this._userTransactionList),
      ],
    );
  }
}