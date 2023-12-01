import 'dart:convert';
import 'dart:developer';
import 'package:food_idea/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ReciepeModel> reciepeList = <ReciepeModel>[];
  TextEditingController searchController = new TextEditingController();

  getRecipe(String query) async {
  String url = "https://api.edamam.com/search?q=$query&app_id=d90bc71b&app_key=aae561ebc75589afa66c9bca6e0ac86f";
  Response response = await get(Uri.parse(url));
  Map data = jsonDecode(response.body);

  data["hits"].forEach((element){
    ReciepeModel reciepeModel = new ReciepeModel();
    reciepeModel = ReciepeModel.fromMap(element["recipe"]);
    reciepeList.add(reciepeModel);
  });

  reciepeList.forEach((element){
    print(element.applabel);
    print(element.appcalories);
  });

  }


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
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        if((searchController.text).replaceAll(" ", "") == "")
                        {
                          print("Blank search");
                        }else{
                          getRecipe(searchController.text);
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: "Let's Cook Something!"),
                      ),
                    ),
                  ],
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
