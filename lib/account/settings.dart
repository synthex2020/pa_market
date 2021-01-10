/*   This is the settings screen for the Pa market app
 *   This was written by Tehillah Kangamba
 *   Pa market is an agriculture app to order crops and have them
 *   delivered to desired locations
 */

import 'package:flutter/material.dart';
class SettingsScreen extends StatelessWidget
{

  // there is no need to create a new material app this will remove the functionality of the pop function in the stack
  //because we are now dealing with a different instance of the app. Material app typica;ly is only called once in the main
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Settings",

      home: Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Settings(),
      ),
    );
  }

}

class Settings  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:<Widget> [
        //
        //Account settings
        //
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Account Settings"),
          subtitle: const Text("Change name,birthday, address and NRC number"),
          onTap:(){
            print("Change address");
          },
        ),
        //
        //Track order
        //
        ListTile(
          leading: const Icon(Icons.gps_fixed),
          title: const Text("Track order"),
          subtitle: const Text("find out where order is"),
          onTap:(){
            //put your next page here
            //yes Tanaka here this will open that page
            //no lie bro right here
            //yes here
            print("track order");
          },
        ),
        //
        //Change payment method
        //
        ListTile(
          leading: const Icon(Icons.credit_card),
          title: const Text("Change payment method"),
          subtitle: const Text("Visa or Mobile Money"),
          onTap:(){
            print("payment method");
          },
        ),
        //
        //Order history
        //
        ListTile(
          leading: const Icon(Icons.description),
          title: const Text("Order history"),
          subtitle: const Text("Previous crops you ordered"),
          onTap:(){
            //put your next page here
            //yes Tanaka here this will open that page
            //no lie bro right here
            //yes here
            print("previous orders");
          },
        ),

        //
        //help
        //
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text("Help"),
          subtitle: const Text("Having account trouble or trouble with order?"),
          onTap:(){
            print("help");
          },
        ),

        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Log out"),
          onTap:(){
            print("help");
          },
        )



      ],

    );
  }

}
