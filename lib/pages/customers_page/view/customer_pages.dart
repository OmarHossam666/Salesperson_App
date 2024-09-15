import 'package:flutter/material.dart';
import 'package:salesperson_app/models/customer.dart';

class CustomersPage extends StatefulWidget {
  const CustomersPage({super.key});

  @override
  _CustomersPageState createState() => _CustomersPageState();
}

class _CustomersPageState extends State<CustomersPage> {
  final List<Customer> customers = [
    Customer(name: 'Mohamed ahmad', city: 'Cairo', phone: '123-456-7890'),
    Customer(name: 'Sara hassan', city: 'Mansoura', phone: '987-654-3210'),
    Customer(name: 'Ali ahmad', city: 'Kafr Elshaikh', phone: '123-456-7890'),
    Customer(name: 'Houda ali', city: 'Demyat', phone: '987-654-3210'),
    Customer(
        name: 'Ahmad mahmoud', city: 'Sharm Elshaikh', phone: '123-456-7890'),
    Customer(name: 'Rana mohamed', city: 'Aswan', phone: '987-654-3210'),
  ];

  void _addNewCustomer() {
    final nameController = TextEditingController();
    final cityController = TextEditingController();
    final phoneController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Customer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final newCustomer = Customer(
                  name: nameController.text,
                  city: cityController.text,
                  phone: phoneController.text,
                );
                setState(() {
                  customers.add(newCustomer);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Customers Page',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search customers',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {},
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text('Add New Customer'),
                onPressed: _addNewCustomer,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: customers.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(
                        customers[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'City: ${customers[index].city}, Phone: ${customers[index].phone}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {},
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}