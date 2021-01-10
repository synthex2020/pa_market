import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pa_market/shared/navBar.dart';

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> {

  getData() async {
    Firebase.initializeApp();
    return await FirebaseFirestore.instance.collection('farms').snapshots();
  }

  Widget displayFarmCard(String name,String province, String city, String url ) {
    return Card();
  }//end display farm card
  @override
  Widget build(BuildContext context) {
    String name;
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
                          if (key == 'name'){
                            name = value;
                          }
                        });
                       //this is where we can add things to our list
                      });
                      return ListView.builder(
                          itemBuilder: (context , index){
                            return Text(name);
                          },
                        itemCount: documents.length,
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
