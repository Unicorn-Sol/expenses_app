import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

// class NewTransaction extends StatefulWidget {
//   final Function addTx;
//
//   NewTransaction(this.addTx);
//
//   @override
//   _NewTransactionState createState() => _NewTransactionState();
// }
//
// class _NewTransactionState extends State<NewTransaction> {
//   final titleController = TextEditingController();
//
//   final amountController = TextEditingController();
//
//   void submitData() {
//     final enteredTitle = titleController.text;
//     final enteredAmount = double.parse(amountController.text);
//
//     if (enteredTitle.isEmpty || enteredAmount <= 0) {
//       return;
//     }
//
//     widget.addTx(
//       enteredTitle,
//       enteredAmount,
//     );
//
//     Navigator.of(context).pop();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5,
//       child: Container(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: <Widget>[
//             TextField(
//               decoration: InputDecoration(labelText: 'Title'),
//               controller: titleController,
//               onSubmitted: (_) => submitData(),
//               // onChanged: (val) {
//               //   titleInput = val;
//               // },
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: 'Amount'),
//               controller: amountController,
//               keyboardType: TextInputType.number,
//               onSubmitted: (_) => submitData(),
//               // onChanged: (val) => amountInput = val,
//             ),
//             FlatButton(
//               child: Text('Add Transaction'),
//               textColor: Colors.purple,
//               onPressed: submitData,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  var _dateChosen;
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _dateChosen==null) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount, _dateChosen);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now())
        .then((value) {
          if(value == null)
            return;
          setState(() {
            _dateChosen = value;
          });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                onSubmitted: (_) => submitData(),
                controller: titleController),
            TextField(
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Amount'),
                onSubmitted: (_) => submitData(),
                controller: amountController),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( _dateChosen==null?'No Date Chosen!': DateFormat.yMMMd().format(_dateChosen)),
                  )),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed:  _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              color: Colors.purple,
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
                submitData();
              },
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
