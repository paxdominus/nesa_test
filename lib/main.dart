import 'package:flutter/material.dart';
import 'package:nesa_test/provider/products_provider.dart';
import 'package:nesa_test/view/products_list_page.dart';
import 'package:provider/provider.dart';

import 'provider/product_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductsProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nesa Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 56, 212, 204)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Nesa Test'),
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
  @override
  void initState() {
    ProductsProvider().updateProducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ProductsListPage();
  }
}
