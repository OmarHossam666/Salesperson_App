import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salesperson App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Salesperson Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isDarkTheme = false;

  void _toggleTheme() {
    setState(() {
      _isDarkTheme = !_isDarkTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: _isDarkTheme ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.indigoAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Salesperson Menu',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        icon: Icon(
                            _isDarkTheme ? Icons.wb_sunny : Icons.nights_stay,
                            color: Colors.white,
                            size: 30),
                        onPressed: _toggleTheme,
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text(
                    'Home',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.people),
                  title: const Text('Customers',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CustomersPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Products',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProductsPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.bar_chart),
                  title: const Text('Sales',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SalesPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

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

class AddCustomerPage extends StatefulWidget {
  const AddCustomerPage({super.key});

  @override
  _AddCustomerPageState createState() => _AddCustomerPageState();
}

class _AddCustomerPageState extends State<AddCustomerPage> {
  final _formKey = GlobalKey<FormState>();

  String fullName = '';
  String email = '';
  String phoneNumber = '';
  String address = '';
  String notes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Customer',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the full name';
                  }
                  return null;
                },
                onSaved: (value) => fullName = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                onSaved: (value) => phoneNumber = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (value) => address = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Notes',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (value) => notes = value!,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                            'Customer added',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                        );
                      }
                    },
                    child: const Text(
                      'Save',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  String productName = '';
  String description = '';
  double price = 0.0;
  int stockQuantity = 0;
  String category = 'Electronics';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Product',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Image.asset(""),
              GestureDetector(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
                onSaved: (value) => productName = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onSaved: (value) => description = value!,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) => price = double.parse(value!),
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Stock Quantity',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || int.tryParse(value) == null) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
                onSaved: (value) => stockQuantity = int.parse(value!),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: category,
                decoration: const InputDecoration(
                  labelText: 'Category',
                  border: OutlineInputBorder(),
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'Electronics', child: Text('Electronics')),
                  DropdownMenuItem(value: 'Clothing', child: Text('Clothing')),
                  DropdownMenuItem(value: 'Books', child: Text('Books')),
                ],
                onChanged: (value) => setState(() {
                  category = value!;
                }),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Product added')),
                        );
                      }
                    },
                    child: const Text(
                      'Save',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancel',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                    value: 'Daily Sales',
                    child: Text('Daily Sales')),
                DropdownMenuItem(
                    value: 'Monthly Sales',
                    child: Text('Monthly Sales')),
                DropdownMenuItem(
                    value: 'Top Products',
                    child: Text('Top Products')),
                DropdownMenuItem(
                    value: 'Customer Sales',
                    child: Text('Customer Sales')),
                DropdownMenuItem(
                    value: 'Profit and Loss',
                    child: Text('Profit and Loss')),
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

class DateFormat {
  DateFormat(String str);

  format(DateTime end) {}
}

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
    Customer(name: 'Ahmad mahmoud', city: 'Sharm Elshaikh', phone: '123-456-7890'),
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

class Customer {
  final String name;
  final String city;
  final String phone;

  Customer({required this.name, required this.city, required this.phone});
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String selectedCategory = 'All';

  final List<Product> allProducts = [
    Product(
      name: 'iPhone 12',
      price: 999.99,
      category: 'Electronics',
      imageUrl:
          'https://th.bing.com/th/id/OIP.9KlhQpoq6sPNI3FerI3xDwHaHa?w=178&h=180&c=7&r=0&o=5&dpr=2.5&pid=1.7',
    ),
    Product(
      name: 'Galaxy S21',
      price: 799.99,
      category: 'Electronics',
      imageUrl:
          'https://th.bing.com/th/id/OIP.1T3AE5c9aRZxkx1p-14G3gHaEK?w=263&h=180&c=7&r=0&o=5&dpr=2.5&pid=1.7',
    ),
    Product(
      name: 'T-Shirt',
      price: 19.99,
      category: 'Clothing',
      imageUrl:
          'https://www.bing.com/th?id=OIP.bD3dT2CazF4__z4TJVz8FQHaHR&w=169&h=150&c=8&rs=1&qlt=90&o=6&dpr=2.5&pid=3.1&rm=2',
    ),
    Product(
      name: 'Headphones',
      price: 199.99,
      category: 'Accessories',
      imageUrl:
          'https://www.bing.com/th?id=OIP.6WZHCb9rVStvjjH43x9kXQHaHa&w=153&h=150&c=8&rs=1&qlt=90&o=6&dpr=2.5&pid=3.1&rm=2',
    ),
  ];

  List<Product> get filteredProducts {
    if (selectedCategory == 'All') {
      return allProducts;
    } else {
      return allProducts
          .where((product) => product.category == selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products Page',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search products',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedCategory,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              items: <String>['All', 'Electronics', 'Clothing', 'Accessories']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add New Product'),
              onPressed: () {},
            ),
            const SizedBox(height: 20),
            Card(
              color: Colors.grey[200],
              child: ListTile(
                leading: const Icon(Icons.pie_chart),
                title: Text(
                  'Total Products :  ${filteredProducts.length}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Top Selling :  iPhone 12',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(filteredProducts[index].imageUrl,
                            width: 100, height: 100, fit: BoxFit.cover),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            filteredProducts[index].name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            '\$${filteredProducts[index].price}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String category;
  final String imageUrl;

  Product({
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
  });
}

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

class SaleItem {
  final String productName;
  final int quantity;
  final double price;

  SaleItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}

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

class DateRangePicker extends StatelessWidget {
  final void Function(DateTime startDate, DateTime endDate) onDateRangeSelected;

  const DateRangePicker({super.key, required this.onDateRangeSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {},
        child: const Text('Select Date Range'),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isNotificationsEnabled = true;
  bool isDarkModeEnabled = false;
  bool isTwoFactorAuthEnabled = false;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: const Text(
                'Update Profile',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.lock),
              title: const Text(
                'Change Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text(
              'Enable Notifications',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: isNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                isNotificationsEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          DropdownButton<String>(
            value: selectedLanguage,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
            items: <String>['English', 'Spanish', 'French', 'Germany', 'Arabic']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedLanguage = newValue!;
              });
            },
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text(
              'Dark Mode',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: isDarkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                isDarkModeEnabled = value;
              });
            },
          ),
          const SizedBox(height: 20),
          SwitchListTile(
            title: const Text(
              'Two-Factor Authentication',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            value: isTwoFactorAuthEnabled,
            onChanged: (bool value) {
              setState(() {
                isTwoFactorAuthEnabled = value;
              });
            },
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.devices),
              title: const Text(
                'Active Sessions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.update),
              title: const Text(
                'Check for Updates',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.backup),
              title: const Text(
                'Backup Settings',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.help),
              title: const Text(
                'Help Center',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.contact_support),
              title: const Text(
                'Contact Support',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
          const SizedBox(height: 20),
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}