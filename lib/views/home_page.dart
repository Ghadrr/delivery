import 'package:flutter/material.dart';
import 'package:helloworld/services/firebase_conect.dart';
import 'package:helloworld/views/feedback.dart';
import 'package:helloworld/views/product_detail.dart';
import 'package:helloworld/views/profile.dart';
import 'package:helloworld/views/wishlist.dart';


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
  int currentIndex = 0;
  List pages = [
    SingleChildScrollView(
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
                      Text("NeedFood"),
                      Text("Delivery"),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Image.network(
                        width: 180,
                        "https://firebasestorage.googleapis.com/v0/b/del1very.appspot.com/o/x_bacon.png?alt=media&token=f0e993b4-4749-4071-aff3-2d865772d4a1"),
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
            child: FutureBuilder(
              future: get_img(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  // print(snapshot.data);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (var i in snapshot.data)
                        InkWell(
                          onTap: () => Navigator.pop(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage())),
                          child: Card(
                            child: Column(children: [
                              Image.network(height: 70, '${i['url_img']}'),
                              Text('${i['nome']}')
                            ]),
                          ),
                        ),
                    ],
                  );
                }
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: [Text("Popular Now")],
            ),
          ),
          FutureBuilder(
            future: get_all_prod(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var allProds = snapshot.data;
                for (var i in allProds) {
                  print(i.runtimeType);
                }
                return Container(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var allProd in allProds)
                            Container(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductDetail(produto: allProd)));
                                },
                                child: Card(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                          height: 70, '${allProd['url_img']}'),
                                      Text('${allProd['nome']}'),
                                      Text("R\$" '${allProd['preco']}'),
                                    ],
                                  ),
                                ),
                              ),
                            )
                        ]),
                  ),
                );
              }
            },
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
    wishlist(),
    feedback(),
    Profile(),
  ];

  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() => currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: true,
      ),
    );
  }
}
