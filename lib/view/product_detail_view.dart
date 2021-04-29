import 'package:cart_bloc/model/item.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  final Item item;

  ProductDetailsView({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Product Detail',
        ),
      ),
      body: Column(),
    );
  }
}
