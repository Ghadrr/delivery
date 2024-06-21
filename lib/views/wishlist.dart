import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_conect.dart';
import 'package:helloworld/views/home_page.dart';

class wishlist extends StatefulWidget {
  var produto;
  wishlist({
    super.key,
  });

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'favoritos',
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.black,
              ),
              onPressed: () async {
                var auth = await limpar_favoritos('favoritos');
                if (auth == true) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    "Lista de favoritos vazia",
                  )));
                } else
                  (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                    "Error",
                  ))));
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            )
          ],
        ),
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
              for (var produto in snapshot.data['favoritos']) {
                (total_preco += produto['preco'] as int);
              }
              return Container(
                margin: EdgeInsets.all(15),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                    for (var i in snapshot.data['favoritos'])
                      Card(
                        child: Column(
                          children: [
                            Text('${i['nome']}'),
                            Image.network(height: 80, '${i['url_img']}'),
                            Text('R\$: ${i['preco']}'),
                            IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                var auth =
                                    await remove_favorite(widget.produto);
                                if (auth == true) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "removovido dos favoritos",
                                  )));
                                } else
                                  (ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    "Error",
                                  ))));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                            ),
                          ],
                        ),
                      ),
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
