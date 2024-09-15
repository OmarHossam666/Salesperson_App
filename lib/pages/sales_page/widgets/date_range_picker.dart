import 'package:flutter/material.dart';

class DateRangePicker extends StatelessWidget {
  final void Function(DateTime startDate, DateTime endDate) onDateRangeSelected;

  const DateRangePicker({super.key, required this.onDateRangeSelected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text('Select Date Range'),
    );
  }
}