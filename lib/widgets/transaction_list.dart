import 'dart:ui';

import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text('No Transaction Added Yet!',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.fill,
                  ),
                  height: 200,
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5,),
                  child: ListTile(
                    title: Text(transactions[index].title),
                    subtitle: Text(
                      DateFormat.yMMMMEEEEd().format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(8),
                          child: FittedBox(
                              child: Text('\$${transactions[index].amount}'))),
                    ),
                    trailing: IconButton(color: Colors.grey,icon: Icon(Icons.delete), onPressed: () => deleteTransaction(transactions[index].id),),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// ListView(
// children: transactions.map((tx) {
// return Card(
// elevation: 5,
// child: Row(
// children: [
// Container(
// margin: EdgeInsets.symmetric(
// vertical: 10.0, horizontal: 20.0),
// padding: EdgeInsets.all(12.0),
// child: Text(
// '\$${tx.amount.toStringAsFixed(2)}',
// style: GoogleFonts.lato(
// color: Colors.purple,
// fontWeight: FontWeight.bold),
// // style: TextStyle(
// //     color: Colors.purple,
// //     fontWeight: FontWeight.bold,
// // ),
// ),
// decoration: BoxDecoration(
// border:
// Border.all(color: Colors.purple, width: 2),
// borderRadius:
// BorderRadius.all(Radius.circular(5.0))),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(tx.title,
// style: GoogleFonts.lato(
// color: Colors.purple,
// fontWeight: FontWeight.bold)),
// Text(
// DateFormat.yMMMMEEEEd().format(tx.date),
// style: TextStyle(color: Colors.grey),
// )
// ],
// )
// ],
// ),
// );
// }).toList(),
// )
