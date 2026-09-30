import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: ProductList()));

class Product {
  final String name, desc;
  final int price;
  final Color color;
  const Product(this.name, this.desc, this.price, this.color);
}

const products = [
  Product('Pixel 1', 'Pixel is the most featureful phone ever', 800, Colors.blue),
  Product('Laptop', 'Laptop is most productive development tool', 2000, Colors.green),
  Product('Tablet', 'Tablet is the most useful device ever for meeting', 1500, Colors.orange),
  Product('Pendrive', 'iPhone is the stylist phone ever', 100, Colors.red),
  Product('Floppy Drive', 'Floppy drive is useful for old computers', 20, Colors.teal),
];

class ProductList extends StatelessWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Navigation'), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: ListView(
        children: products.map((p) => ListTile(
          tileColor: p.color,
          title: Text(p.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          subtitle: Text(p.desc, style: const TextStyle(color: Colors.white70)),
          trailing: Text('${p.price}', style: const TextStyle(color: Colors.white)),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetail(p: p))),
        )).toList(),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final Product p;
  const ProductDetail({super.key, required this.p});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(p.name), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(height: 150, width: 150, color: p.color, alignment: Alignment.center,
          child: Text(p.name, style: const TextStyle(fontSize: 24, color: Colors.white))),
        const SizedBox(height: 16),
        Text(p.desc),
        const SizedBox(height: 8),
        Text('Price: ${p.price}', style: const TextStyle(fontSize: 18)),
      ])),
    );
  }
}
