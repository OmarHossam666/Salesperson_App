import 'package:flutter/material.dart';

class ViewSalesPage extends StatelessWidget {
  const ViewSalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'View Sales',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              color: Colors.grey[200],
              child: const ListTile(
                title: Text(
                  'Total Sales Today',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                subtitle: Text(
                  '\$5000',
                  style: TextStyle(color: Colors.green, fontSize: 28),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Top Selling Products',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Card(
              color: Colors.grey[200],
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/product1.jpg'),
                ),
                title: Text(
                  'iPhone 12',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Sold: 50 units'),
              ),
            ),
            Card(
              color: Colors.grey[200],
              child: const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/product2.jpg'),
                ),
                title: Text(
                  'MacBook Pro',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Sold: 30 units'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Recent Orders',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Card(
              color: Colors.grey[200],
              child: const ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text(
                  'Order #12345',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Client: John Doe - \$200'),
              ),
            ),
            Card(
              color: Colors.grey[200],
              child: const ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text(
                  'Order #12346',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Client: Jane Smith - \$350'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}