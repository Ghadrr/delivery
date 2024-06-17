import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_conect.dart';

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
                        Text("A noite"),
                        Text("Começa"),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            },
                            child: Text("Aqui")),
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
              margin: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FutureBuilder(
                    future: get_img(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        print(snapshot.data);

                        return Row(
                          children: [
                            for (var i in snapshot.data)
                              Text('$i')
                          ],
                        );
                      }
                    },
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
