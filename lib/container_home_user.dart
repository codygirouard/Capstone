import 'package:flutter/material.dart';

class HomeContainerUser extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Column(
        children: [
          setPage(height, width),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.search),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.check),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.cancel),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.search),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.search),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.search),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.search),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.search),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Image.asset("images/Pill.jpg"),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "8:00 AM",
                          ),
                          Text(
                            "Medicine name",
                          ),
                          Text(
                            "Jan 1 - feb 24",
                          ),
                        ],
                      ),
                      trailing: Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget setPage(
    double height,
    double width,
  ) {
    Color red800 = Colors.red[800];

    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.home, color: Colors.transparent, size: 25),
              Text(
                "Home",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Icon(Icons.home, color: Colors.white, size: 25),
            ],
          ),
          color: Colors.blue,
          height: height * 0.22,
          width: width,
        ),

        Container(), // Required some widget in between to float AppBar

        Positioned(
          // To take AppBar Size only
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(
              Icons.menu,
              color: red800,
            ),
            primary: false,
            title: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: red800),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: red800),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
