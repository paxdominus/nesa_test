import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nesa_test/provider/product_provider.dart';
import 'package:nesa_test/provider/products_provider.dart';
import 'package:nesa_test/view/product_detail_page.dart';
import 'package:provider/provider.dart';

class ProductsListPage extends StatelessWidget {
  const ProductsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
        ),
        body: Consumer<ProductsProvider>(
          builder: (context, value, child) => GridView.builder(
            itemCount: value.productsModel?.products?.length ?? 0,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: InkWell(
                    onTap: () async {
                      await ProductProvider().getProduct(
                          value.productsModel?.products?[index].id.toString() ??
                              "1");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage()));
                    },
                    child: GridTile(
                      footer: Text(
                        value.productsModel?.products?[index].title ?? "",
                        style: const TextStyle(backgroundColor: Colors.white),
                      ),
                      child: CachedNetworkImage(
                        imageUrl:
                            value.productsModel?.products?[index].thumbnail ??
                                "",
                        errorWidget: (context, url, error) => const Icon(
                          Icons.card_travel_outlined,
                          color: Colors.amber,
                        ),
                      ), //just for testing, will fill with image later
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
