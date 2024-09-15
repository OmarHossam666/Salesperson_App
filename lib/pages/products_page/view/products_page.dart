import 'package:flutter/material.dart';
import 'package:salesperson_app/models/product.dart';

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