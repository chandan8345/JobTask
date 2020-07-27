import 'package:flutter/material.dart';
import 'package:jobtask/pages/Step1.dart';
import 'package:jobtask/widgets/Components.dart';

class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController zipcodeController = new TextEditingController();
  TextEditingController drivingLicenseController = new TextEditingController();
  TextEditingController taxiLicenseController = new TextEditingController();
  int step = 3;
  bool secureText = true;
  List country, state, city;
  Components components;

  @override
  void initState() {
    components = new Components();
    super.initState();
  }

  void passwordStyle() {
    setState(() {
      secureText != false ? this.secureText = false : this.secureText = true;
    });
  }

  void submit() {
    if(_formKey.currentState.validate()){
      //submit code
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => Step1());
            Navigator.pushReplacement(context, route);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          Center(
              child: FlatButton(
            onPressed: () {
              print('Pressed Step');
            },
            child: components.appbarBtn(step),
          )),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            bodyContents(secureText, components, nameController,
                emailController, passwordController, addressController),
            SizedBox(
              height: 30,
            ),
            submitBtn()
          ],
        ),
      ),
    );
  }

  Widget bodyContents(secureText, widget, name, email, password, address) =>
      Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            widget.fieldTitle('FULL NAME'),
            textField(name, TextInputType.text),
            SizedBox(
              height: 20,
            ),
            widget.fieldTitle('EMAIL'),
            textField(email, TextInputType.emailAddress),
            SizedBox(
              height: 20,
            ),
            widget.fieldTitle('PASSWORD'),
            passwordField(secureText, password, TextInputType.emailAddress),
            SizedBox(
              height: 20,
            ),
            widget.fieldTitle('ADDRESS'),
            textField(address, TextInputType.text),
            SizedBox(
              height: 20,
            ),
            rowField1(),
            SizedBox(
              height: 20,
            ),
            rowField2(zipcodeController, TextInputType.text),
            SizedBox(
              height: 20,
            ),
            rowField3(drivingLicenseController, taxiLicenseController,
                TextInputType.text),
          ],
        ),
      );

  Widget submitBtn() => FlatButton(
        onPressed: () {
          submit();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.orange,
          child: Center(
            child: Text(
              'CONTINUE',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      );

  Widget rowField1() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                components.fieldTitle('COUNTRY'),
                dropdown(),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                components.fieldTitle('STATE'),
                dropdown(),
              ],
            ),
          )
        ],
      );

  Widget rowField2(controller, keyboardType) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                components.fieldTitle('CITY'),
                dropdown(),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                components.fieldTitle('ZIP CODE'),
                SizedBox(
                  height: 8,
                ),
                textField(controller, keyboardType),
              ],
            ),
          )
        ],
      );

  Widget rowField3(
          drivingLicensecontroller, taxiLicenseController, keyboardType) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                components.fieldTitle('DRIVING LICENSE NO'),
                SizedBox(
                  height: 8,
                ),
                textField(drivingLicenseController, keyboardType),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                components.fieldTitle('AUSTRALIAN TAXI LICENCE NO'),
                SizedBox(
                  height: 8,
                ),
                textField(taxiLicenseController, keyboardType),
              ],
            ),
          )
        ],
      );

  Widget dropdown() => DropdownButtonFormField(
        decoration: new InputDecoration(
          labelText: '',
          fillColor: Colors.white,
          isDense: true,
          border: UnderlineInputBorder(),
          //fillColor: Colors.green
        ),
        value: country,
        items: (country != null)
            ? country.map((array) {
                return DropdownMenuItem(
                  value: array['name'].toString(),
                  child: Text(array['name']),
                );
              }).toList()
            : null,
        onChanged: (value) {
          setState(() {});
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter your department';
          }
          return null;
        },
      );

  Widget textField(controller, keyboardType) => TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
          hintText: '',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'please enter your name';
          } else {
            return null;
          }
        },
      );

  Widget passwordField(secureText, controller, keyboardType) => TextFormField(
        keyboardType: keyboardType,
        controller: controller,
        obscureText: secureText,
        decoration: InputDecoration(
          hintText: '',
          suffixIcon: IconButton(
            onPressed: () {
              passwordStyle();
            },
            icon: secureText != false
                ? Icon(Icons.visibility_off)
                : Icon(Icons.remove_red_eye),
          ),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'please enter password';
          } else {
            return null;
          }
        },
      );
}
