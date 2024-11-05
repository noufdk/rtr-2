import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppTextField extends StatefulWidget {
  const AppTextField(
      {super.key,
      this.textEditingController,
      this.label,
      this.suffixIcon,
      this.isDate,
      this.readOnly});
  final TextEditingController? textEditingController;
  final String? label;
  final bool? readOnly;
  final bool? isDate;
  final Widget? suffixIcon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      readOnly: widget.readOnly ?? false,
      onTap: widget.isDate == true
          ? () {
              _selectDate();
            }
          : null,
      decoration: InputDecoration(
        label: Text(widget.label ?? ""),
        suffixIcon: widget.suffixIcon,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey)),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime(2000), // Date range starts from 2000
      lastDate: DateTime(2101), // Date range ends at 2101
    );

    if (pickedDate != null) {
      // Format the picked date to a string and set it to the controller
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      setState(() {
        widget.textEditingController!.text = formattedDate;
      });
    }
  }
}
