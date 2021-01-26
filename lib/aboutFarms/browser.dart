import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pa_market/home/home.dart';
import 'package:pa_market/shared/navBar.dart';

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {

  String city  , description , logo  , owner,email ,produce,
      phone,province,street,streetNumber, farmDocId;
  List display = [];
  String name;
  getData() async {
    Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection('farms').snapshots();
  }

  Widget showCard(String name, String description, String url) {
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
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: NavigationBar(selectedIndex: 1,),
      body: Center(
        child: FutureBuilder(
          future: getData(),
          builder: (context , snapshot) {
            if (snapshot.connectionState == ConnectionState.done){
              return StreamBuilder(
                  builder: (context , snapshot) {
                    if(snapshot.hasData){
                      QuerySnapshot querySnapshot = snapshot.data;
                      List<QueryDocumentSnapshot> documents = querySnapshot.docs;
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
                       //this is where we can add things to our list

                        display.add(new Farm(
                          city: city, street: street, description: description,
                          produce: produce, province: province, owner: owner, logo: logo
                        ));
                      });
                      return ListView.builder(
                          itemBuilder: (context , index){
                            return showCard( display[index].name, display[index].description, display[index].logo);
                          },
                        itemCount: display.length,
                      );
                    }else{
                      return Center(child: Text("No data present"),);
                    }
                  },
                  stream: snapshot.data,
              );
            }else{
              return Center(child: Text("Connection not established"),);
            }//end if-else
          },
        ),
      ),
    );
  }
}
