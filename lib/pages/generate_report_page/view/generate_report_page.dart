import 'package:flutter/material.dart';
import 'package:salesperson_app/models/date_format.dart';

class GenerateReportPage extends StatefulWidget {
  const GenerateReportPage({super.key});

  @override
  _GenerateReportPageState createState() => _GenerateReportPageState();
}

class _GenerateReportPageState extends State<GenerateReportPage> {
  String _reportType = 'Daily Sales';
  DateTimeRange? _selectedDateRange;

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDateRange) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generate Report',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'Select Report Type',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            DropdownButton<String>(
              value: _reportType,
              onChanged: (String? newValue) {
                setState(() {
                  _reportType = newValue!;
                });
              },
              items: const [
                DropdownMenuItem(
                    value: 'Daily Sales', child: Text('Daily Sales')),
                DropdownMenuItem(
                    value: 'Monthly Sales', child: Text('Monthly Sales')),
                DropdownMenuItem(
                    value: 'Top Products', child: Text('Top Products')),
                DropdownMenuItem(
                    value: 'Customer Sales', child: Text('Customer Sales')),
                DropdownMenuItem(
                    value: 'Profit and Loss', child: Text('Profit and Loss')),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Date Range',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            TextButton(
              onPressed: () => _selectDateRange(context),
              child: Text(
                _selectedDateRange == null
                    ? 'Select Date Range'
                    : '${DateFormat('MM/dd/yyyy').format(_selectedDateRange!.start)} - ${DateFormat('MM/dd/yyyy').format(_selectedDateRange!.end)}',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Generate Report'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download),
              label: const Text('Export as PDF'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.file_copy),
              label: const Text('Export as CSV'),
            ),
          ],
        ),
      ),
    );
  }
}