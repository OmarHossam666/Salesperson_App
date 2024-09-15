import 'package:flutter/material.dart';
import 'package:salesperson_app/models/sale.dart';
import 'package:salesperson_app/models/sale_item.dart';
import 'package:salesperson_app/pages/sales_details_page/view/sales_details_page.dart';
import 'package:salesperson_app/pages/sales_page/widgets/date_range_picker.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Sale> sales = [
      Sale(
        invoiceNumber: '0010',
        customerName: 'Mohamed ahmad',
        date: '2005-09-12',
        totalAmount: 299.99,
        items: [
          SaleItem(productName: 'iPhone 12', quantity: 1, price: 999.99),
          SaleItem(productName: 'Accessories', quantity: 2, price: 19.99),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sales Page',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search Sales',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              DateRangePicker(
                onDateRangeSelected: (startDate, endDate) {},
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add New Sale'),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              Card(
                color: Colors.grey[200],
                child: const ListTile(
                  leading: Icon(Icons.pie_chart),
                  title: Text(
                    'Total Sales',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  subtitle: Text(
                    'Best Selling Product :  iPhone 12',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: sales.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey[200],
                    child: ListTile(
                      leading: const Icon(Icons.receipt),
                      title: Text(
                        'Invoice #${sales[index].invoiceNumber}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                          'Customer: ${sales[index].customerName}, Date: ${sales[index].date}'),
                      trailing: Text(
                        '\$${sales[index].totalAmount}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 17),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SalesDetailsPage(sale: sales[index]),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}