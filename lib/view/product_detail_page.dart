import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nesa_test/provider/product_provider.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({super.key});

  var titleController = TextEditingController();
  var descController = TextEditingController();
  var priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, value, child) {
      titleController.text = value.productModel?.title ?? "";
      descController.text = value.productModel?.description ?? "";
      priceController.text = value.productModel?.price.toString() ?? "";

      return Scaffold(
        appBar: AppBar(
          title: Text(value.productModel?.title ?? ""),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => Dialog(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: TextField(
                                      controller: titleController,
                                      decoration: InputDecoration(
                                          labelText: "title",
                                          hintText: "title",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: TextField(
                                      controller: descController,
                                      decoration: InputDecoration(
                                          labelText: "description",
                                          hintText: "description",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    child: TextField(
                                      controller: priceController,
                                      decoration: InputDecoration(
                                          labelText: "price",
                                          hintText: "price",
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        ProductProvider().editProduct(
                                            value.productModel?.id.toString() ??
                                                "1",
                                            titleController.text.trim(),
                                            descController.text.trim(),
                                            priceController.text.trim());
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Update")),
                                ],
                              ),
                            ),
                          ));
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: CachedNetworkImage(
                imageUrl: value.productModel?.thumbnail ?? "",
                errorWidget: (context, url, error) =>
                    const Icon(Icons.card_travel_outlined),
              ),
            ),
            Text(value.productModel?.description ?? ""),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Category :  "),
                Text(value.productModel?.category ?? ""),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Rating :  "),
                Text(value.productModel?.rating.toString() ?? ""),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Stock :  "),
                Text(value.productModel?.stock.toString() ?? ""),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Price :  "),
                Text(value.productModel?.price.toString() ?? ""),
              ],
            ),
          ],
        )),
      );
    });
  }
}
