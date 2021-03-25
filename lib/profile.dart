import 'package:flutter/material.dart';
import 'bottom_bar.dart';

class HomeContainerProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person, color: Colors.white),
          )
        ],
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              width: width,
              color: Color(0xFF242424),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: new BoxDecoration(
                        color: Colors.grey[200],
                        shape: BoxShape.circle,
                      ),
                      height: 100,
                      width: 100,
                      child: Icon(Icons.person, size: 50.0)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Abhaya Neupame", style: TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text("Abhaya Neupame",
                              style: TextStyle(color: Colors.white)),
                          Text("Height", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Abhaya Neupame",
                              style: TextStyle(color: Colors.white)),
                          Text("Weight", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Abhaya Neupame",
                              style: TextStyle(color: Colors.white)),
                          Text("BMI", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("CVS/PHARMACY at Denton",
                      style: TextStyle(color: Colors.white)),
                  Text("Pharmacy", style: TextStyle(color: Colors.white)),
                  Text("Blue Cross Blue Shield",
                      style: TextStyle(color: Colors.white)),
                  Text("Insurance", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 25.0, left: 25.0),
              height: 50,
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("PCP", style: TextStyle(color: Colors.white)),
                  Icon(Icons.edit, color: Colors.white)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr Laya Neupane, DO"),
                    SizedBox(height: 20.0),
                    Text("Family Phisician"),
                    SizedBox(height: 20.0),
                    Text("2128 Fleur De Lis Ct\nArlington, TX 76012"),
                    SizedBox(height: 20.0),
                    Text("Contact:\n(469)671-1111"),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
