import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/services/firebase_conect.dart';
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.produto['nome'],
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () async {
                var auth = await add_favorite(widget.produto);
                if (auth == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    "Produto Adicionado aos favoritos",
                  )));
                } else
                  (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    "Error",
                  ))));
                Navigator.pop(context,
                    MaterialPageRoute(builder: (context) => carrinho()));
              },
            )
          ],
        ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Produto:')],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.produto['nome']),
                  Text('R\$: ${widget.produto['preco']}'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Descrição:')],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text(widget.produto['descricao'])],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      var auth = await add_cart(widget.produto);
                      if (auth == true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Produto Adicionado ao carrinho",
                        )));
                      } else
                        (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          "Error",
                        ))));
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
