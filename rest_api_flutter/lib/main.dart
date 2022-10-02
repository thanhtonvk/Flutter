import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/Product.dart';

void main() {
  runApp(const MyApp());
}

List<Product> parseProducts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Product>((json) => Product.fromMap(json)).toList();
}

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('http://192.168.56.1:8000/product.json'));
  if (response.statusCode == 200) {
    return parseProducts(response.body);
  }
  throw Exception('unable tofetch products form the rest api');
}

class MyApp extends StatelessWidget {
  final Future<List<Product>> products;

  const MyApp({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
          title: 'Product Navigation demo home page', products: products,),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Future<List<Product>> products;

  const MyHomePage({Key? key, required this.title, required this.products})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product Navigation')),
      body: Center(
        child: Future<,
      ),
    )
  }
}
