import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dede_patmah/core/models/user_app_model.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var _formKey = GlobalKey<FormState>();
  UserApp userApp;

  @override
  Widget build(BuildContext context) {
    userApp = ModalRoute.of(context).settings.arguments ?? UserApp();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.done,
              color: Colors.blue,
            ),
            onPressed: () => _editProfile(context),
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: userApp.id ?? '',
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Id',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please insert your ID';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userApp.id = value.trim();
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: userApp.name ?? '',
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Name',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please insert yout name';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userApp.name = value.trim();
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: userApp.desc ?? '',
                      maxLines: 4,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Description',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please insert description about you';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userApp.desc = value.trim();
                      },
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: userApp.image ?? '',
                      maxLines: 3,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelText: 'Photo URL',
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please insert your photo URL';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userApp.image = value.trim();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Provide your personal information, even if the accounts is used for bussiness, a pet or something else. This won\'n be a part of your public profile.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editProfile(BuildContext context) {
    var state = _formKey.currentState;

    if (state.validate()) {
      state.save();

      showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Profile Changed'),
            content: Text('Do you want to save your edits?'),
            actions: [
              CupertinoDialogAction(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: Text('Save'),
                onPressed: () {
                  //close dialog
                  Navigator.pop(context);
                  //close page
                  Navigator.pop(context, userApp);
                },
              )
            ],
          );
        },
      );
    }
  }
}
