import 'package:flutter/material.dart';
import 'package:pa_market/account/previousOrders.dart';
import 'package:pa_market/account/settings.dart';
import 'package:pa_market/shared/navBar.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text("Account Settings"),
          ),
          body:AccountSettingsForm(),
          bottomNavigationBar: NavigationBar(selectedIndex: 2,),
        ));
  }
}


class AccountSettingsForm extends StatefulWidget {
  @override
  _AccountSettingsFormState createState() => _AccountSettingsFormState();
}

class _AccountSettingsFormState extends State<AccountSettingsForm> {
  String firstName="";
  String lastName="";
  String nrcNum="";
  String email="";
  String phoneNumber="";
  String deliveraryAddress="";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'First Name'),
      maxLength: 15,

      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        firstName = value;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Last Name'),
      maxLength: 15,

      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        lastName = value;
      },
    );
  }

  Widget _buildNrcNum() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'NRC Number'),
      maxLength: 15,

      validator: (String value) {
        if (value.isEmpty) {
          return 'NRC number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        nrcNum = value;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      maxLength: 15,

      validator: (String value) {
        if (value.isEmpty) {
          return 'Email Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        email = value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      maxLength: 15,

      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        phoneNumber = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Deliverary address'),
      maxLength: 15,

      validator: (String value) {
        if (value.isEmpty) {
          return 'First Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        deliveraryAddress = value;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return  ListView(
      children:<Widget> [

        Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: _buildFirstName()
                        ),
                      ],
                    ),


                  ),


                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: _buildLastName()
                        ),
                      ],
                    ),
                  ),

                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: _buildNrcNum()
                        ),
                      ],
                    ),
                  ),

                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: _buildAddress()
                        ),
                      ],
                    ),
                  ),

                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: _buildEmail()
                        ),
                      ],
                    ),
                  ),

                  ListTile(
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: _buildPhoneNumber()
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 100),
                  RaisedButton(
                      child: Text(
                        'Change details',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }

                        _formKey.currentState.save();
                        print(firstName);
                        print(lastName);
                        print(nrcNum);
                        print(email);
                        print(phoneNumber);
                        print(deliveraryAddress);
                      }
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: IconButton(icon: Icon(Icons.settings), onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsScreen()));
                      })),
                      Expanded(child: IconButton(icon: Icon(Icons.history), onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderList()));
                      }))
                    ],
                  )
                ]
            )

        )

      ],
    );
  }
}
