import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF808AFD),
      appBar: AppBar(
        backgroundColor: Color(0xFF808AFD),
        elevation: 0,
        centerTitle: true,
        title: Text("Now Playing"),
        leading: Icon(Icons.arrow_back_ios),
        actions: [Icon(Icons.star), SizedBox(width: 10)],
      ),
      body: SlidingUpPanel(
        maxHeight: 500,
        minHeight: 490,
        padding: EdgeInsets.only(top: 10),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(40), topLeft: Radius.circular(40)),
        panelBuilder: (scrollController) =>
            buildSlidingPabel(scrollController: scrollController),
        body: null,
      ),
    );
  }
}

Widget buildSlidingPabel({@required ScrollController scrollController}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: 5,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Color(0xFF81E9ED),
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                scale: 2.5,
                alignment: Alignment.bottomCenter,
                image: AssetImage("assets/image/Tony Robbins.png"),
                fit: BoxFit.scaleDown),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Tony Robbins",
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF3941A2),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Topic : What Is Life",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            SizedBox(width: 15),
            Text(
              "20 Min",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(
            "Anthony Jay Robbins is an American author, coach, motivational speaker, and philanthropist. Robbins is known for his infomercials, seminars, and self-help books including the books Unlimited Power and Awaken the Giant Within. His seminars are organized through Robbins Research International",
            style: TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    ),
  );
}
