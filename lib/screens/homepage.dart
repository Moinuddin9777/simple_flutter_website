import 'dart:convert';
import 'package:shoppy_app/screens/items.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// Import your BrandItemsList widget here

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = [];
  List<dynamic> different = [];
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json'));

    if (response.statusCode == 200) {
      data = json.decode(response.body);
      setState(() {
        isLoading = false;
        different = data.map((product) => product['brand']).toSet().toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 235, 110),
        title: const Text('Welcome to iGRAND sponsy Brands'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ),
          itemCount: different.length,
          itemBuilder: (context, index) {
            Color itemColor = getForIndex(index);
            if (different[index] != null) {
              return GridTile(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            BrandItemsList(brand: different[index])));
                  },
                  child: Card(
                    color: itemColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          different[index].toString().toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Color getForIndex(int index) {
    return Color.fromARGB(
      255,
      64 + index * 10,
      235 - index * 10,
      175 + index * 10,
    );
  }
}
