import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:helloworld/views/login_page.dart';
import 'package:helloworld/views/product_detail.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search Result: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search Suggestions'),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.fastfood),
            SizedBox(
              width: 10,
            ),
            Text(
              "NeedFood",
              style: TextStyle(fontSize: 20),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.amber,
              height: 150,
              margin: EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text("Promoção"),
                        Text("Hamburguer"),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetail()));
                            },
                            child: Text("Comprar")),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Image.network(
                          width: 180, "https://via.placeholder.com/100"),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [Text("Categories")],
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                    child: Column(
                      children: [
                        Image.network("https://via.placeholder.com/70"),
                        Text("Hamburgueres"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                    child: Column(
                      children: [
                        Image.network("https://via.placeholder.com/70"),
                        Text("Bebidas"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage())),
                    child: Column(
                      children: [
                        Image.network("https://via.placeholder.com/70"),
                        Text("Combos"),
                      ],
                    ),
                  ),
                
                ],
              ),
            ),
             Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [Text("Popular Now")],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Image.network(
                              width: 100, "https://via.placeholder.com/100"),
                          Text("data"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
                 Container(
              margin: EdgeInsets.all(15),
              child: Row(
                children: [Text("Recommended")],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) {
                    return Container(
                      margin: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Image.network(
                              width: 100, "https://via.placeholder.com/100"),
                          Text("data"),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
