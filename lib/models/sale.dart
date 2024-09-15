import 'package:salesperson_app/models/sale_item.dart';

class Sale {
  final String invoiceNumber;
  final String customerName;
  final String date;
  final double totalAmount;
  final List<SaleItem> items;

  Sale({
    required this.invoiceNumber,
    required this.customerName,
    required this.date,
    required this.totalAmount,
    required this.items,
  });
}