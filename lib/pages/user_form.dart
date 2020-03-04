import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_example/providers/user_provider.dart';

class UserFormPage extends StatefulWidget {
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _lastnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(hintText: "name"),
                onChanged: (text) {
                  provider.setName(text);
                },
              ),
              TextField(
                controller: _lastnameController,
                decoration: InputDecoration(hintText: "lastname"),
                onChanged: (text) {
                  provider.setLastname(text);
                },
              ),
              Consumer<UserProvider>(
                builder: (_, _provider, widget) {
                  return Slider(
                    min: 0,
                    max: 100,
                    onChanged: (value) {
                      _provider.setAge(value.toInt());
                    },
                    value: _provider.age != null ? _provider.age.toDouble() : 0,
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.black12,
                padding: EdgeInsets.all(10),
                child: Consumer<UserProvider>(
                  builder: (_, _provider, widget) {
                    return Text(
                        "name: ${_provider.name}, lastname:${_provider.lastname}, age: ${_provider.age}");
                  },
                ),
              ),
              FlatButton(
                child: Text("GO TO DETAIL"),
                onPressed: () {
                  Navigator.pushNamed(context, 'detail');
                },
              ),
              FlatButton(
                child: Text("LOGOUT"),
                onPressed: () {
                  provider.logOut();
                  _nameController.text = '';
                  _lastnameController.text = '';
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
