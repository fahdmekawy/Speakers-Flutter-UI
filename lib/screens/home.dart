import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speakers/widgets/categories.dart';
import 'package:speakers/widgets/contents_widget.dart';
import 'package:speakers/widgets/new_list_widget.dart';
import 'package:speakers/widgets/speaker_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'action_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  int _index = 0;
  List<Map<String, String>> data = [
    {"image": "assets/image/girl.png"},
    {"image": "assets/image/girl.png"},
    {"image": "assets/image/girl.png"},
  ];

  List<Map<String, dynamic>> speakers_data = [
    {
      "image": "assets/image/Tony Robbins.png",
      "name": "Tony Robbins",
      "color": Color(0xFF81E9ED),
      "resource": "Ted"
    },
    {
      "image": "assets/image/Nick Vujicic.png",
      "name": "Nick Vujicic",
      "color": Color(0xFFFFCCDA),
      "resource": "YouTube"
    },
    {
      "image": "assets/image/Dave Ramsey.png",
      "name": "Dave Ramsey",
      "resource": "Ted",
      "color": Color(0xFFBCC9FF),
    },
    {
      "image": "assets/image/Stephen Covey.png",
      "name": "Stephen Covey",
      "resource": "YouTube",
      "color": Colors.grey[400],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF3941A2),
          child: Icon(
            Icons.play_arrow,
            size: 35,
          ),
          elevation: 0,
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: GNav(
              selectedIndex: _index,
              onTabChange: (index) {
                setState(() {
                  _index = index;
                });
              },
              curve: Curves.fastOutSlowIn,
              duration: Duration(
                milliseconds: 100,
              ),
              tabs: [
                buildGButton(icon: Icons.home, name: "Home"),
                buildGButton(icon: Icons.search, name: "Search"),
                buildGButton(icon: Icons.favorite, name: "Favorite"),
                buildGButton(icon: Icons.person, name: "Profile"),
              ],
            ),
          ),
        ),
        appBar: AppbarBuilder(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              children: <Widget>[
                Categories(),
                SizedBox(height: 15),
                SizedBox(
                  height: 180,
                  width: 300,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: data.length,
                    itemBuilder: (context, index) => Contents(
                      image: data[index]["image"],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    data.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Speakers",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 190,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: speakers_data.length,
                    itemBuilder: (BuildContext buildContext, _) => InkWell(
                      onTap: () {
                        if (_ == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ActionScreen(),
                            ),
                          );
                        }
                      },
                      child: Speakers_widget(
                        image: speakers_data[_]["image"],
                        name: speakers_data[_]["name"],
                        color: speakers_data[_]["color"],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "New List",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GridView.count(
                  controller: ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  childAspectRatio: 0.8,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: List.generate(
                    speakers_data.length,
                    (index) => New_list_widget(
                      image: speakers_data[index]["image"],
                      title: speakers_data[index]["resource"],
                      color: speakers_data[index]["color"],
                    ),
                  ),
                ),
                // gridViewWidget(context),
                SizedBox(height: 55),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GButton buildGButton({IconData icon, String name}) {
    return GButton(
      margin: EdgeInsets.symmetric(horizontal: 10),
      gap: 2,
      icon: icon,
      iconColor: Colors.grey,
      iconActiveColor: Color(0xFF3941A2),
      text: name,
      textColor: Color(0xFF3941A2),
      backgroundColor: Colors.purple.withOpacity(0.2),
      iconSize: 25,
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
    );
  }

  PreferredSize AppbarBuilder(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(double.infinity, 70),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Bold',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' talk',
                      style: TextStyle(
                        color: Color(0xFF707070),
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[300],
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/image/fahd.jpg",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      height: 7,
      width: currentPage == index ? 20 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.red : Colors.grey[400],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
