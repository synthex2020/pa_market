/*  This class is the home class that will list the farms availiable on the platform

 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pa_market/shared/navBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List list = [];
  String city  , description , logo , name , owner,email ,produce,
      phone,province,street,streetNumber, farmDocId;
  String searchInput;
  final _key = GlobalKey<FormState>();

  List obtainSearchResults (String search) {
    List results = [];
    results.clear();
    //runs a linear search for the results
    list.forEach((element) {
      String name = element.name;
      if (name !=null) {
        if (name.contains(searchInput)){
          results.add(element);
        }//end if statement
      }else{
        print(name);
      }
    });
    print(results.length);
    return results;
  }//end search results
  getData () async {
    Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection('farms').get();
  }

  Widget farmCard (String name, String description, String url,Farm dataObject) {
    //representation of the farms on each card
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(url,),
                radius: 50,
              ),

            ),
          ),
          SizedBox(width: 5,),
          Expanded(child: Text("Farm Name: " + name + "\nDescription: " + description, style: TextStyle(fontSize: 14),)),
         Expanded(child:  FlatButton(
             onPressed: () {
                Navigator.pushNamed(context,
                  '/produce',
                  arguments: dataObject
                );
             },
             child: Text("Open")
         ),),
        ],
      ),
    );
  }//end method

  @override
  Widget build(BuildContext context) {
    list.clear();
    return Scaffold(
      appBar:AppBar(
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Form(
                key: _key,
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: TextFormField(
                    validator: (val) => val.isEmpty ? "Cannot search for null item" : null,
                    decoration: InputDecoration(
                        hintText: "Search"
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchInput = value;
                      });
                    },
                  ),
                ),
              ),
              FlatButton(
                  onPressed: () {
                    //go to a search results page
                    Navigator.pushNamed(
                      context, 
                      '/searchResults',
                      arguments: obtainSearchResults(searchInput)
                    );
                  },
                  child: Icon(Icons.search)
              ),
            ],
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      bottomNavigationBar: NavigationBar(selectedIndex: 0,),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage("https://www.rushlimbaugh.com/wp-content/uploads/2018/08/APP-South-African-Farm.jpg"),
                    fit: BoxFit.cover,
                  )
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("Listed Farms", style: TextStyle(fontSize: 30, color: Colors.white),)
                ],
              ),
            ),
            FutureBuilder(
              builder: (context , snapshot) {
                //check if the connection has been established
                if(snapshot.connectionState == ConnectionState.done){
                  return StreamBuilder(
                      builder: (context , snapshot) {
                        if(snapshot.hasData){
                          QuerySnapshot querySnapshot = snapshot.data;
                          List<DocumentSnapshot> documents = querySnapshot.docs;
                          documents.forEach((element) {
                            element.data().forEach((key, value) {
                              if(key == 'city'){
                                city = value;
                              }else if(key == 'description'){
                                description = value;
                              }else if(key == 'email'){
                                email = value;
                              }else if(key == 'logo'){
                                logo = value;
                              }else if(key == 'name'){
                                name = value;
                              }else if(key == 'owner'){
                                owner = value;
                              }else if (key == 'phone'){
                                phone = value.toString();
                              }else if(key == 'produce'){
                                produce = value;
                              }else if (key == 'province'){
                                province = value;
                              }else if (key == 'street'){
                                street = value;
                              }else{
                                streetNumber = value;
                                farmDocId = element.id;
                                print(farmDocId);
                              }
                            });
                            //we add to the list here
                            list.add(
                                Farm(city: city, description: description, logo: logo, name: name, owner: owner,
                                    phone: phone, produce: produce, province: province,street: street, streetNumber: streetNumber, farmDocId: farmDocId
                                )
                            );
                          });
                          return Container(
                            child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (context , index) {
                                return farmCard(list[index].name, list[index].description, list[index].logo,list[index]);
                              },
                            ),
                            height: MediaQuery.of(context).size.height,
                          );
                        }else{
                          return Center(
                            child: Text("Error 404 not found"),
                          );
                        }
                      },
                    stream: FirebaseFirestore.instance.collection('farms').snapshots(),
                  );
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }//end if-else

              },
              future: getData(),
            ),
          ],
        ),
      )
    );
  }
}

class Farm {
  String city  , description , logo , name , owner, produce,
          phone,province,street,streetNumber, farmDocId;
  Farm({this.city , this.description, this.logo , this.name, this.owner , this.produce , this.phone, this.province,
    this.street, this.streetNumber, this.farmDocId
  });

}
