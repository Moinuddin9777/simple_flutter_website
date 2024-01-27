import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  List<String> brands = [];
  String selectedBrand = '';
  List<String> products = [];

  @override
  void initState() {
    super.initState();
    fetchBrands();
  }

  Future<void> fetchBrands() async {
    final response = await http.get(
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        brands = data.map((product) => product['brand']).toSet().toList();
      });
    } else {
      throw Exception('Failed to load brands');
    }
  }

  Future<void> fetchProducts() async {
    if (selectedBrand.isNotEmpty) {
      final response = await http.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=$selectedBrand'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          products = data;
        });
      } else {
        throw Exception('Failed to load products');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makeup API'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: selectedBrand,
            onChanged: (value) {
              setState(() {
                selectedBrand = value!;
              });
              fetchProducts();
            },
            items: brands.map<DropdownMenuItem<String>>((String brand) {
              return DropdownMenuItem<String>(
                value: brand,
                child: Text(brand),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ListTile(
                  title: Text(product[index]),
                  subtitle: Text(product[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
