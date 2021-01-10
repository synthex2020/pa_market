/*  This class will display the produce the selected farm sells

 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pa_market/home/home.dart';
//the specific document information that is the doc id for the farm should be recived in the data object
class Produce extends StatefulWidget {
  @override
  _ProduceState createState() => _ProduceState();
}

class _ProduceState extends State<Produce> {
  String docId = "IMZUQwokwK82i1gv2s7O";
  String logo , name , price;
  List list = [];
  
  getData () async {
    Firebase.initializeApp();
  }//end get data

  Widget showProfile(String imageSrc, String name, String price,Product product) {
    //shows the cards that holds the stuff that can be ordered
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: CircleAvatar(
              backgroundImage: NetworkImage(imageSrc),
              radius: 50,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(name, style: TextStyle(fontSize: 15),),
                Text(price, style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
          Expanded(
            child: FlatButton(
                onPressed: () {
                Navigator.pushNamed(context,
                  '/order',
                  arguments: product
                );
                },
                child: Text("Order")
            ),
          )
        ],
      ),
    );
  }//end method
  @override
  Widget build(BuildContext context) {
    list.clear();
    final Farm args = ModalRoute.of(context).settings.arguments;
    print(args.logo);
    docId = args.farmDocId;
    print(docId);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://mucci-production-user-uploads-bucket.s3.amazonaws.com/images/Header-BG_us-tomatoes-towering-high.original.jpg"),
                        fit: BoxFit.cover
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Lorem Ipsum Farms", style: TextStyle(fontSize: 20,color: Colors.white),)
                  ],
                )
            ),
            FutureBuilder(
              builder: (context , snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                    QuerySnapshot querysnapshot = snapshot.data;
                    List<DocumentSnapshot> documents = querysnapshot.docs;
                    documents.forEach((element) {
                      element.data().forEach((key, value) {
                        if(key == 'name'){
                          name = value;
                        }else if(key == 'price'){
                          price = value;
                        }else{
                          //we have logo
                          logo = value;
                        }
                      });
                      //here is where we add the produce to the list
                      list.add(Product(name: name, logo: logo, price: price));
                    });
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context , index) {
                          return showProfile(list[index].logo, list[index].name,list[index].price, list[index]);
                        },
                      ),
                    );
                  }else{
                    return Center(child: Text("Error 404 not found"),);
                  }//end if-else
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }//end if-else
              },
              future: FirebaseFirestore.instance.collection('farms').doc(docId).collection('produce').get(),
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  String logo , name , price;

  Product({this.logo , this.name, this.price});
}
