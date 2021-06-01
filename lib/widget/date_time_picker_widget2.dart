import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:alumnisoftwareapp/widget/notifcation_dialog.dart';

class DateTimePickerWidget2 extends StatefulWidget {
  @override
  _DateTimePickerWidget2State createState() => _DateTimePickerWidget2State();
}

class _DateTimePickerWidget2State extends State<DateTimePickerWidget2> {
  DateTime selectedDate = null;

  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Text(selectedDate== null ? "Choose date&time " : dateFormat.format(selectedDate), style: TextStyle(fontWeight: FontWeight.bold),),
        RaisedButton(
          child: Text('Choose'),
          onPressed: () async {
            selectedDate = DateTime.now();
            print("what is selecteddate: "+ selectedDate.toString());
            showDateTimeDialog(context, initialDate: selectedDate,
                onSelectedDate: (selectedDate) {
              setState(() {
                this.selectedDate = selectedDate;
              });
            });
          },
        ),
      ],
    );
  }
}
