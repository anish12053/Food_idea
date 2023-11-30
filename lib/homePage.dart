import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff213A50),
                    Color(0xff071938),
                  ]
                ),
              ),
            ),
            SafeArea(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      if((searchController.text).replaceAll(" ", "") == "")
                      {
                        print("Blank search");
                      }else{
                        Navigator.pushReplacementNamed(context, "/loading",arguments: {
                          "searchText" : searchController.text,
                        });
                      }

                    },
                    child: TextField(
                      controller: searchController,
                      autocorrect: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(Icons.search),
                        hintText: "What do you wanna cook today!",
                      ),
                    ),
                  ),
                ),
            ),
            Center(child: SafeArea(child: Text("Home Page",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),))),
          ],
        ),
    );
  }
}
