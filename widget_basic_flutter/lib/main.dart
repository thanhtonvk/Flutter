import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(
        title: 'Hello',
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
          children: const [
            ProductBox(
                name: 'Iphone',
                description: "description",
                price: 15000,
                image: 'iphone.jpg'),
            ProductBox(
                name: 'Iphone',
                description: "description",
                price: 15000,
                image: 'iphone.jpg'),
            ProductBox(
                name: 'Iphone',
                description: "description",
                price: 15000,
                image: 'iphone.jpg'),
          ],
        ));
  }
}

class ProductBox extends StatelessWidget {
  final String name, description;
  final int price;
  final String image;

  const ProductBox(
      {Key? key,
      required this.name,
      required this.description,
      required this.price,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(image),
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(description),
                  Text('Price: $price')
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
