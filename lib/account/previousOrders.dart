import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}


class Order{
  String productName, productPrice, productDescription, productImage;
  Order({this.productDescription, this.productImage, this.productName, this.productPrice});
}
class _OrderListState extends State<OrderList> {

  List<Order> ordersList = [
  Order(productName: 'beef', productPrice: ' CAD 26', productDescription: '2KG', productImage: 'beef.png'),
  Order(productName: 'Chicken', productPrice: ' CAD 50', productDescription: '5KG', productImage: 'chicken.png'),
  Order(productName: 'beef', productPrice: ' CAD 12', productDescription: '8KG', productImage: 'beef.png'),
  Order(productName: 'Chicken', productPrice: ' CAD 5', productDescription: '5KG', productImage: 'chicken.png'),
  Order(productName: 'beef', productPrice: ' CAD 7', productDescription: '6KG', productImage: 'chicken.png'),
  Order(productName: 'beef', productPrice: ' CAD 15', productDescription: '2KG', productImage: 'chicken.png'),
  Order(productName: 'Chicken', productPrice: ' CAD 30', productDescription: '4KG', productImage: 'chicken.png'),
  Order(productName: 'Chicken', productPrice: ' CAD 50', productDescription: '20KG', productImage: 'chicken.png'),
  Order(productName: 'beef', productPrice: ' CAD 35', productDescription: '2KG', productImage: 'chicken.png'),
  Order(productName: 'Chicken', productPrice: ' CAD 18', productDescription: '4KG', productImage: 'chicken.png'),




  ];

  Widget orderTemplate(Order){
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            Order.productName,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            )
          ),
          SizedBox(height: 3.0),
          Text(
            Order.productDescription,
            style: TextStyle(
              fontSize:14.0,
              color: Colors.grey[800]
            ),
          )
        ],
        )
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Order History'),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
        body: ListView.builder(

          itemCount: ordersList.length,
          itemBuilder: (context, index){

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  title: Text('productName'),
                  subtitle: Text('ordersList''[index].productDescription + ordersList[index].productPrice'),
                  leading: CircleAvatar(
                   child: Text('ordersList[index].productName[0]'),
                    //backgroundImage: AssetImage('assets/${ordersList[index].productDescription}'),
                  ),
                ),
              ),
            );

          },
    ),
    );
  }
}
