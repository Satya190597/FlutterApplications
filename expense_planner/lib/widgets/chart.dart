import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransaction;

  Chart(this._recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    /**
     * List.generate(<length>,<generator>) - Creates a list with length positions and fills it with values
     * by calling generator for each index in the range length-1 increasing order.
     */
    return List.generate(7, (index) {
      /**
       * Substract current date with index. In order to get day for past 7 days.
       */
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < _recentTransaction.length; i++) {
        if (_recentTransaction[i].date.day == weekday.day &&
            _recentTransaction[i].date.month == weekday.month &&
            _recentTransaction[i].date.year == weekday.year) {
          totalSum += _recentTransaction[i].amount;
        }
      }
      return {
        'DAY': DateFormat.E().format(weekday).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0, (sum, element) {
      return sum + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        /**
         * Card child - while hold the entire layout of the chart.
         */
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              /**
         * Row children - will hold 7 bar representing 7 days in a week - they will generate dynamically.
         */
              children: <Widget>[
                ...groupedTransactionValues.map((element) {
                  return Flexible(
                      fit: FlexFit.tight,
                      child: ChartBar(
                          element['DAY'],
                          element['amount'],
                          maxSpending == 0.0
                              ? 0.0
                              : (double.parse(element['amount'].toString()) /
                                  maxSpending)));
                }).toList()
              ],
            )));
  }
}
