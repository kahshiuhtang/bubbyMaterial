import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  DateTime selectedDate;
  DatePicker({required this.selectedDate});
  DatePickerState createState() => DatePickerState(selectedDate: selectedDate);
}

class DatePickerState extends State<DatePicker> {
  DateTime selectedDate;
  DatePickerState({required this.selectedDate});
  Future<void> _selectDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromARGB(255, 124, 108, 119), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary:
                    Color.fromARGB(255, 170, 166, 148), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (newDate == null) return;
    setState(() {
      selectedDate = newDate;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.only(left: 15.0, top: 5),
            child: Text('Birthday:',
                style: TextStyle(
                    color: Color.fromARGB(255, 124, 108, 119),
                    fontSize: 16,
                    fontWeight: FontWeight.bold))),
        Padding(
            padding: EdgeInsets.only(top: 5),
            child: TextButton(
              style: TextButton.styleFrom(
                  primary: Color.fromARGB(255, 124, 108, 119)),
              child: Row(children: <Widget>[
                Text(
                    '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 124, 108, 119),
                        fontWeight: FontWeight.normal)),
                Icon(Icons.calendar_month_outlined)
              ]),
              onPressed: () => _selectDate(context),
            )),
      ],
    ));
  }
}
