import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/views/carrinho.dart';
import 'package:helloworld/views/home_page.dart';

class ProductDetail extends StatefulWidget {
  var produto;

  ProductDetail({super.key, required this.produto});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produto['nome']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: Center(
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        widget.produto['url_img'],
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  Text(widget.produto['nome']),
                  Text('${widget.produto['preco']}'),
                  Text(widget.produto['descricao'])
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => carrinho()));
                    },
                    child: Text("Adicionar ao Carrinho")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
