import 'dart:io';

import 'package:expense_planner_app/widgets/adaptiveflatbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(
      this.addNewTransaction(String title, double amount, DateTime chosendate));

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _title = TextEditingController();
  final _amount = TextEditingController();
  DateTime? _selectedDate = null;

  void _submitData() {
    if (_amount.text.isEmpty) {
      return;
    }
    final enteredTitle = _title.text;
    final enteredAmount = double.parse(_amount.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addNewTransaction(enteredTitle, enteredAmount, _selectedDate);
    //closing the keyboard
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                controller: _title,
                decoration: const InputDecoration(labelText: "Title"),
                onSubmitted: (_) => _submitData(),
                /*onChanged: (value){
                        titleInput = value;
                      },*/
              ),
              TextField(
                controller: _amount,
                decoration: const InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),

                /* onChanged: (value){
                        amountInput= value;
                      },*/
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedDate == null
                          ? "No Date Chosen!"
                          : " Picked Date :${DateFormat.yMd().format(_selectedDate!)}",
                    ),
                  ),
                  AdaptiveFlatButton(
                      text: "Choose Date", handler: _presentDatePicker)
                ],
              ),
              RaisedButton(
                  onPressed: _submitData,
                  color: Theme.of(context).primaryColor,
                  child: const Text(
                    "Add Transaction",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
