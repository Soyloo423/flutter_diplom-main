import 'package:flutter/material.dart';
import 'package:flutter_diplom/screens/ui/filter.dart';
import 'package:flutter_diplom/screens/ui/room.dart';
import 'package:flutter_diplom/screens/ui/travelCard.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeApp(),
  ));
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  //here i'm going to add a list of image url that I collected from the internet
  //you can use the image that you want, just copy and paste their Urls here inside the list
  List<String> urls = [
    "https://www.example.com/image1.jpg",
    "https://www.example.com/image2.jpg",
    "https://www.example.com/image3.jpg",
    // Add more URLs as needed
  ];
  //sometime we can face some http request erreur if the owner of the picture delted it or the url is not available
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFF6F7FF),
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return FilterPage();
                  }),
                );
              },
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Let's start by adding the text
            Text(
              "Улаанбаатар",
              style: TextStyle(
                color: Colors.black,
                fontSize: 26.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Location",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Now let's add some elevation to our text field
            //to do this we need to wrap it in a Material widget
            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(20.0),
              shadowColor: Color(0x55434343),
              child: TextField(
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: "Search for...",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 30.0),
            //Now let's Add a Tabulation bar
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Color.fromARGB(209, 16, 193, 216),
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Color.fromARGB(255, 21, 160, 240),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Өрөө",
                        ),
                        Tab(
                          text: "Оффис",
                        ),
                        Tab(
                          text: "Амралтын газар",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 300.0,
                      child: TabBarView(
                        children: [
                          //Now let's create our first tab page
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Now let's add and test our first card
                                travelCard(
                                  urls[0],
                                  "Luxury Hotel",
                                  "Caroline",
                                  3,
                                  () {
                                    // Add your navigation logic here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RoomPage()), // Navigate to RoomPage
                                    );
                                  },
                                ),

                                travelCard(
                                  urls[0],
                                  "Luxury Hotel",
                                  "Caroline",
                                  3,
                                  () {
                                    // Add your navigation logic here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RoomPage()), // Navigate to RoomPage
                                    );
                                  },
                                ),

                                travelCard(
                                  urls[0],
                                  "Luxury Hotel",
                                  "Caroline",
                                  3,
                                  () {
                                    // Add your navigation logic here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RoomPage()), // Navigate to RoomPage
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                //Here you can add what ever you want
                                travelCard(
                                  urls[0],
                                  "Luxury Hotel",
                                  "Caroline",
                                  3,
                                  () {
                                    // Add your navigation logic here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RoomPage()), // Navigate to RoomPage
                                    );
                                  },
                                ),

                                travelCard(
                                  urls[0],
                                  "Luxury Hotel",
                                  "Caroline",
                                  3,
                                  () {
                                    // Add your navigation logic here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RoomPage()), // Navigate to RoomPage
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Color(0xFFB7B7B7),
        selectedItemColor: Color.fromARGB(255, 64, 153, 236),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.save),
            label: "save",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Booking list",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
        ],
      ),
    );
  }
}
