import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  String name;
  String image;
  String desc;
  String preco;

  ProductDetail(
      {super.key,
      required this.name,
      required this.image,
      required this.desc,
      required this.preco});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBar(
        ,
      ),
    );
  }
}
