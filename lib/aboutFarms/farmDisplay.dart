import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/*  The purpose of this is to show the selected farm's information

 */

class FarmDisplay extends StatefulWidget {
  @override
  _FarmDisplayState createState() => _FarmDisplayState();
}

class _FarmDisplayState extends State<FarmDisplay> {
  String city  , description , logo , name , owner,email ,produce,
      phone,province,street,streetNumber, farmDocId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Farm display" , style: TextStyle(color: Colors.black),),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.all(10), child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: NetworkImage(logo)),
            Divider(),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Text("Farm name: $name \t owned by $owner" , style: TextStyle(color: Colors.black),),
            SizedBox(height: MediaQuery.of(context).size.height/80,),
            Text("Farm description: \n$description" , style: TextStyle(color: Colors.black),maxLines: 50,overflow: TextOverflow.ellipsis,),
            SizedBox(height: MediaQuery.of(context).size.height/50,),
            Text("Location of farm: \nStreet \n$streetNumber $street\nProvince $province"),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: RaisedButton(
                  onPressed: () {
                    //call intent for email
                  },
                  child: Text("Email farm" , style: TextStyle(color: Colors.black),),
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                )),
                Expanded(child: RaisedButton(
                  onPressed: () {
                    //call intent for email
                  },
                  child: Text("Call or text farm" , style: TextStyle(color: Colors.black),),
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ))

              ],
            )

          ],
        ),
      ),),
    );
  }
}
