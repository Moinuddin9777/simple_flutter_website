import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

String dropdownvalue = '';

class BrandItemWidget extends StatefulWidget {
  const BrandItemWidget({super.key, required this.brand});
  final String brand;

  @override
  State<BrandItemWidget> createState() => _BrandItemWidgetState();
}

class _BrandItemWidgetState extends State<BrandItemWidget> {
  List<dynamic> brandData = [];
  List<dynamic> data = [];

  var dropdownMenuEntries = [];
  var entriesCount = 0;

  var isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    fetchProductType();
  }

  Future<void> fetchProductType() async {
    if (dropdownvalue.isNotEmpty) {
      isLoading = true;
      final response = await http.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?product_type=$dropdownvalue&brand=${widget.brand}'));
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        setState(() {
          isLoading = false;
        });
      }
    }
    if (dropdownvalue.isNotEmpty && dropdownvalue == 'All') {
      isLoading = true;
      final response = await http.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=${widget.brand}'));
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  Future<void> fetchData() async {
    if (widget.brand.isNotEmpty) {
      final response = await http.get(Uri.parse(
          'https://makeup-api.herokuapp.com/api/v1/products.json?brand=${widget.brand}'));
      if (response.statusCode == 200) {
        brandData = json.decode(response.body);

        setState(() {
          dropdownMenuEntries = brandData
              .map((product) => product['product_type'])
              .toSet()
              .toList();
        });
        dropdownMenuEntries.add('All');
        dropdownvalue = 'All';
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: MediaQuery.of(context).size.width * 0.40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: DropdownButtonFormField<String>(
            hint: const Text(
              'Products',
              style: TextStyle(fontSize: 15),
            ),
            value: null,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
            items: dropdownMenuEntries.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            focusColor: Colors.white,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  fetchProductType();
                  setState(() {
                    productsView();
                  });
                },
                child: const Text('Search Produt'),
              ),
            ],
          )
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(),
        child: productsView(),
      ),
    );
  }

  GridView productsView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 5,
          child: InkWell(
            onTap: () {
              // Add the onTap functionality
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.network(
                      data[index]['image_link'],
                      errorBuilder: ((context, error, stackTrace) {
                        return Image.asset('assets/noimage.png');
                      }),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data[index]['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rating: ${data[index]['rating']}',
                            style: const TextStyle(fontSize: 12),
                          ),
                          Text(
                            'Price \$${data[index]['price']}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
