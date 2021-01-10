/*  The screen allows the user to select how much of the product they want aa well as
    special instructions
 */

import 'package:flutter/material.dart';
import 'package:pa_market/produce/produce.dart';
import 'package:pa_market/shoppingCart/bloc.dart';
import 'package:pa_market/shoppingCart/checkout.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

//gather relevent data from previous page
//TODO: Price point needs to be set before the item is added to the cart

class _OrdersState extends State<Orders> {
  String productUrl = "https://morningchores.com/wp-content/uploads/2018/05/Growing-Pumpkins-Your-Guide-to-Plant-Grow-and-Harvest-Pumpkins-FB.jpg";
  String dropDown = "2kg";
  String name= "tomotoe";
  int price = 50;
  @override
  Widget build(BuildContext context) {
    final Product product = ModalRoute.of(context).settings.arguments;
    productUrl = product.logo;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(padding: EdgeInsets.all(10), child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(productUrl),
                  )
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 200,
                  child: Text("Select Amount: "),
                ),
                DropdownButton<String>(
                  value: dropDown,
                  elevation: 16,
                  onChanged: (val) {
                    setState(() {
                      dropDown = val;
                    });
                  },
                  items: <String>['2kg' , '4kg' , '6kg' , '8kg', '10kg'].
                  map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Add extra instructions"
                ),

              ),
            ),
            SizedBox(height: 10,),
            RaisedButton(
              onPressed: () {
               //go back to the selection screen after adding product to cart
                var item = {'name': name, 'price':price, 'id': 1, };
                bloc.addToCart(item);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("item added to shopping cart"),));
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Checkout()));
              },
              child: Text("Add to cart"),
            )
          ],
        ),
      ),),
    );
  }
}
