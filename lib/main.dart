import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: ProductList()));

class Product {
  final String name, desc;
  final int price;
  final Color color;
  const Product(this.name, this.desc, this.price, this.color);
}

const products = [
  Product('Pixel', 'Pixel is the most featureful phone ever', 800, Colors.blue),
  Product('Laptop', 'Laptop is most productive development tool', 2000, Colors.green),
  Product('Tablet', 'Tablet is the most useful device ever for meeting', 1500, Color(0xFF9E9D24)),
  Product('Pendrive', 'iPhone is the stylist phone ever', 100, Colors.red),
  Product('Floppy Drive', 'Floppy drive is useful for old computers', 20, Colors.teal),
];

class ProductList extends StatelessWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Navigation'), backgroundColor: Colors.blue, foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, i) {
          final p = products[i];
          return GestureDetector(
            onTap: () => Navigator.push(ctx, MaterialPageRoute(builder: (_) => ProductDetail(p: p))),
            child: SizedBox(
              height: 100,
              child: Row(children: [
                Expanded(
                  child: Container(
                    color: p.color,
                    alignment: Alignment.center,
                    child: Text(p.name.toLowerCase(), style: const TextStyle(fontSize: 22, color: Colors.white)),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(p.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      Text(p.desc, style: const TextStyle(fontSize: 11)),
                      Text('Price: ${p.price}', style: const TextStyle(fontSize: 12)),
                      Row(children: List.generate(3, (_) => const Icon(Icons.star_border, size: 16, color: Colors.amber))),
                    ]),
                  ),
                ),
              ]),
            ),
          );
        },
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
      body: Column(children: [
        Expanded(
          flex: 3,
          child: Container(
            color: p.color,
            alignment: Alignment.center,
            child: Text(p.name.toLowerCase(), style: const TextStyle(fontSize: 40, color: Colors.white)),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(p.name, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 8),
              Text(p.desc),
              const SizedBox(height: 16),
              Text('Price: ${p.price}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Row(children: List.generate(3, (_) => const Icon(Icons.star_border, color: Colors.amber))),
            ]),
          ),
        ),
      ]),
    );
  }
}
