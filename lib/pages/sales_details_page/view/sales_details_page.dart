import 'package:flutter/material.dart';
import 'package:salesperson_app/models/sale.dart';

class SalesDetailsPage extends StatelessWidget {
  final Sale sale;

  const SalesDetailsPage({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sale Details',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Invoice #${sale.invoiceNumber}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text('Customer: ${sale.customerName}'),
            Text('Date: ${sale.date}'),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: sale.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      sale.items[index].productName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Quantity: ${sale.items[index].quantity}'),
                    trailing: Text(
                      '\$${sale.items[index].price}',
                      style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  );
                },
              ),
            ),
            Text('Total Amount: \$${sale.totalAmount}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}