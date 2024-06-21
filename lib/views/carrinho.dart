import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/services/firebase_conect.dart';

class carrinho extends StatefulWidget {
  const carrinho({super.key});

  @override
  State<carrinho> createState() => _carrinhoState();
}

class _carrinhoState extends State<carrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho'),
      ),
      body: Container(
        child: FutureBuilder(
          future: get_user_elements(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print(snapshot.data);
              var total_preco = 0;
              for (var produto in snapshot.data['carrinho']) {
                (total_preco += produto['preco'] as int);
              }
              return Container(
                margin: EdgeInsets.all(15),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    for (var i in snapshot.data['carrinho'])
                      Card(
                        child: Column(
                          children: [
                            Text('${i['nome']}'),
                            Image.network(height: 80,'${i['url_img']}'),
                            Text('R\$: ${i['preco']}')
                          ],
                        ),
                      ),
                    Center(
                      child: Container(
                        child: Column(
                          children: [Text("Preço Total: R\$ $total_preco")],
                        ),
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ElevatedButton(
                              onPressed: () async {
                                var auth =
                                    await comprar(snapshot.data['carrinho']);
                                if (auth == true) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Compra Efetuada",
                                  )));
                                } else
                                  (ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Error",
                                  ))));
                                Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => carrinho()));
                              },
                              child: Text("Comprar")),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
