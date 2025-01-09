import 'package:flutter/material.dart';
import '../../../core/constant/constant.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class BirthDayDateFiled extends StatelessWidget {
  final DateTime initialDate;
  void Function(DateTime?) onSavedFunction;

  TextEditingController _controller = TextEditingController();

  BirthDayDateFiled({super.key, required this.onSavedFunction, required this.initialDate });

  @override
  Widget build(BuildContext context) {
    _controller.text = DateFormat.yMMMd('en_US').format(initialDate).toString();
    return TextFormField(
      controller: _controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      readOnly: true,
      onTap: () => _selectBirthDayDate(context,initialDate),
      
      decoration: const InputDecoration(
        hintText: "Birth Day",
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(vertical: defaultPadding * 0.75),
          child: Icon(Icons.calendar_today)
        ),
      ),
    );
  }

  Future<void> _selectBirthDayDate(BuildContext context,DateTime? initialDate) async{
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now()
    );
    if(pickedDate != null){
      _controller.text = DateFormat.yMMMd('en_US').format(pickedDate).toString();
      onSavedFunction(pickedDate);
    }
  }
}
