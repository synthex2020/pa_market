import 'package:flutter/material.dart';


/// this page receives the search results in the form of an object list hence no need for a db connection
class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {

  Widget showCard(String name, String description, String url, double height, double width) {
    //use a container to obtain a background image

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: NetworkImage(url)),
          Text("Name: $name" , style: TextStyle(color: Colors.black),),
          SizedBox(height: MediaQuery.of(context).size.height/60,),
          Text("Description: $description" , style: TextStyle(color: Colors.black),maxLines: 3, overflow: TextOverflow.ellipsis,),
          SizedBox(height: MediaQuery.of(context).size.height/60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.grey[400],
                child: Text("View" , style: TextStyle(color: Colors.black),),
                onPressed: () {
                  //go to the relevant page
                },
              ),)
            ],
          )

        ],
      ),
    );
  }//end show card
  @override
  Widget build(BuildContext context) {
    final List farms = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Search results", style: TextStyle(color: Colors.black),),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.all(10), child: Center(
        child: (farms.isNotEmpty)?ListView.builder(
          itemBuilder: (context , index) {
            return showCard(
              farms[index].name, farms[index].description, farms[index].logo,
              MediaQuery.of(context).size.height,
              MediaQuery.of(context).size.width
            );
          },
          itemCount:farms.length,
        ): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child:Text("Search result not found. The list is empty"),
            )
          ],
        ),
      ),),
    );
  }
}
