import 'package:flutter/material.dart';
import 'package:salesperson_app/pages/add_customer_page/view/add_customer_page.dart';
import 'package:salesperson_app/pages/add_product_page/view/add_product_page.dart';
import 'package:salesperson_app/pages/generate_report_page/view/generate_report_page.dart';
import 'package:salesperson_app/pages/view_sales_page/view/view_sales_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "HomePage",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Text(
                  'Sales Statistics',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text('Today\'s Sales',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      Text(
                        '\$2000',
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text('Products Sold',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text('Top Product',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                      ),
                      Text(
                        'iPhone 12',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Card(
                child: Text(
                  'Today\'s Tasks',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              Card(
                color: Colors.grey[300],
                child: const ListTile(
                  leading: Icon(
                    Icons.notification_important,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    'Follow up with client XYZ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Scheduled for today at 2:00 PM'),
                ),
              ),
              Card(
                color: Colors.grey[300],
                child: const ListTile(
                  leading: Icon(
                    Icons.notification_important,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    'Deliver order #12345',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Due today by 5:00 PM'),
                ),
              ),
              const SizedBox(height: 40),
              Card(
                child: Text(
                  'Quick Access',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    color: Colors.indigo,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.indigo,
                      ),
                      label: const Text(
                        'Add Customer',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                            fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddCustomerPage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.green,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.add_shopping_cart,
                        color: Colors.green,
                      ),
                      label: const Text(
                        'Add Product',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddProductPage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.bar_chart,
                        color: Colors.blue,
                      ),
                      label: const Text(
                        'View Sales',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 17),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewSalesPage()),
                        );
                      },
                    ),
                  ),
                  Container(
                    color: Colors.red,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.report,
                        color: Colors.red,
                      ),
                      label: const Text(
                        'Generate Report',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GenerateReportPage()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}