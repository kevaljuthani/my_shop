import 'package:flutter/material.dart';
import 'package:my_shop/providers/products.dart';
import 'package:my_shop/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProduct = Provider.of<Products>(context).findById(productId);
    return Scaffold(
        appBar: AppBar(
          title: Text(loadedProduct.title),
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '\$${loadedProduct.price}',
                style: TextStyle(color: Colors.grey, fontSize: 20),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ));
  }
}
