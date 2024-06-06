import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
            FlutterLogo(size: 30),
            SizedBox(
              width: 10,
            ),
            Text(
              "Pará_Food",
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
      body: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 100,
            margin: EdgeInsets.all(13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text("a"),
                    Text("data"),
                    Container(
                      margin: EdgeInsets.all(16),
                      color: Colors.red,
                      child: Text("data"),
                    ),
                  ],
                ),
                SizedBox(
                  width: 56,
                ),
                Text("IMAGEM"),
              ],
            ),
          ),
          Container(
            color: Colors.blue,
            height: 110,
            margin: EdgeInsets.all(13),
            child: Column(
              children: [
                Text('Categories'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.deepPurpleAccent,
                      margin: EdgeInsets.all(10),
                      height: 70,
                      width: 100,
                    ),
                    Container(
                      color: Colors.deepPurpleAccent,
                      margin: EdgeInsets.all(10),
                      height: 70,
                      width: 100,
                    ),
                    Container(
                      color: Colors.deepPurpleAccent,
                      margin: EdgeInsets.all(10),
                      height: 70,
                      width: 100,
                    ),
                  ],
                ),
              ],
              
            ),
          ),
        ],
      ),

      // body: Column(children: [
      //   Expanded(
      //     child: CarouselSlider(
      //       options: CarouselOptions(
      //         height: 200.0,
      //         autoPlay: true,
      //         enlargeCenterPage: true,
      //       ),
      //       items: imgList
      //           .map((item) => Container(
      //                 child: Center(
      //                   child:
      //                       Image.network(item, fit: BoxFit.cover, width: 1000),
      //                 ),
      //               ))
      //           .toList(),
      //     ),
      //   ),
      //   Center(child: Text("Parazinho")),
      // ]),
    );
  }
}
