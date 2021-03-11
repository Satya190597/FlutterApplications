import 'package:flutter/material.dart';

import 'widgets/chart.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';

import 'models/transaction.dart';

void main() {
  runApp(ExpensePlanner());
}

class ExpensePlanner extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: Home(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(color: Colors.white)),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(fontFamily: 'OpenSans', fontSize: 20),
              ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  // Default List of transaction.
  final List<Transaction> _userTransactionList = [
    // Transaction(
    //     id: 'TR1',
    //     title: 'Bought A T-shirt',
    //     amount: 99.00,
    //     date: DateTime.now()),
    // Transaction(
    //     id: 'TR2',
    //     title: 'Bought A Notebook',
    //     amount: 10.00,
    //     date: DateTime.now()),
  ];

  /// Getter - Recent Transactions.
  List<Transaction> get _recentTransaction {
    return _userTransactionList.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)))
          ? true
          : false;
    }).toList();
  }

  String titleInput;
  String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // Private method to add new transaction.
  void _addNewTransaction(String title, double amount, DateTime selectedDate) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: selectedDate);
    setState(() {
      _userTransactionList.add(newTransaction);
    });
  }

  // Show Model Popup.
  void startAddNewTransaction(BuildContext context) {
    // How we got buildContext in builder.
    showModalBottomSheet(
        context: context,
        builder: (builderContext) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => startAddNewTransaction(context))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /**
           * Card Width depend on it's child element.
           * And Text Width depend on it's parent element.
           * In order to break this dependency we can wrap text element inside child element.
           * But Card can also takes is parent width if it's parent have a fix width defined.
           *
           * double.infinity -> will take full width.
           */
            Chart(_recentTransaction),
            // -- Input Area For Our UserInput --
            TransactionList(_userTransactionList),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
