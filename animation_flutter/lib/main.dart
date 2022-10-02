import 'package:flutter/material.dart';
import 'package:animation_flutter/items/ProductBox.dart';
import 'models/Product.dart';
import 'routes/ProductPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
   Animation<double> animation; 
   AnimationController controller; 
   
   @override 
   void initState() {
      super.initState(); 
      controller = AnimationController(
         duration: const Duration(seconds: 10), vsync: this); 
      animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller); 
      controller.forward(); 
   } 
   // This widget is the root of your application. 
   @override 
   Widget build(BuildContext context) {
      controller.forward(); 
      return MaterialApp( 
         title: 'Flutter Demo', theme: ThemeData(primarySwatch: Colors.blue,), 
         home: MyHomePage(title: 'Product layout demo home page', animation: animation,) 
      ); 
   } 
   @override 
   void dispose() {
      controller.dispose();
      super.dispose(); 
   } 
}

class MyHomePage extends StatelessWidget {
  final String title;
  final Animation<double> animation;
  final items = Product.getProducts();

  MyHomePage({Key? key, required this.title, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => GestureDetector(
          child: ProductBox(item: items[index]),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductPage(item: items[index])));
          },
        ),
        itemCount: items.length,
      ),
    );
  }
}
