import 'dart:ui';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:jobtask/pages/Step3.dart';
import 'package:jobtask/widgets/Components.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobileController = new TextEditingController();
  int step = 1;
  var maskTextInputFormatter = MaskTextInputFormatter(
      mask: "##### #####", filter: {"#": RegExp(r'[0-9]')});
  List country;
  Components components;

  @override
  void initState() {
    components = new Components();
    super.initState();
  }

  void submit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        leading: IconButton(
          onPressed: () {},
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
            bodyContents(),
            SizedBox(
              height: 40,
            ),
            submitBtn(),
            text(),
            SizedBox(
              height: 80,
            ),
            Divider(),
            SizedBox(
              height: 80,
            ),
            facebookBtn(),
            SizedBox(
              height: 20,
            ),
            googleBtn(),
            text()
          ],
        ),
      ),
    );
  }

  Widget bodyContents() => Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            components.fieldTitle('MOBILE'),
            SizedBox(
              height: 20,
            ),
            rowfield(),
          ],
        ),
      );

  Widget rowfield() => Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 5,
            child: countryCode(),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            child: Padding(
              padding: EdgeInsets.only(top:0),
              child: textField(mobileController),
            ),
          )
        ],
      );

  Widget text() => Padding(
        padding: EdgeInsets.only(left: 20, right: 0, top: 10, bottom: 0),
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "By tapping continue, you agree to ",
              style: TextStyle(fontSize: 14, color: Colors.grey),
              children: <TextSpan>[
                TextSpan(
                    text: 'Terms and Conditions ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black)),
                TextSpan(
                    text: 'and',
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
                TextSpan(
                    text: ' Privacy Policy ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.black)),
                TextSpan(
                    text: 'of Faretrim',
                    style: TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
          ),
        ),
      );

  Widget textField(controller) => TextField(
      controller: controller,
      inputFormatters: [maskTextInputFormatter],
      autocorrect: false,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
          hintText: "23422 23434",
          enabledBorder: InputBorder.none,
          fillColor: Colors.transparent,
          filled: true));

  Widget countryCode() => CountryCodePicker(
        onChanged: print,
        initialSelection: 'IT',
        favorite: ['+61', 'AUS'],
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
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

  Widget submitBtn() => FlatButton(
        onPressed: () {
          Route route = MaterialPageRoute(builder: (context) => Step3());
          Navigator.pushReplacement(context, route);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: Colors.orange,
          child: Center(
            child: Text(
              'CONTINUE',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      );

  Widget facebookBtn() => FlatButton(
        onPressed: () {
          submit();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: Colors.lightBlue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://stpetersburggroup.com/wp-content/uploads/2018/05/Facebook-Logo.png",
                height: 40,
              ),
              Text(
                '  LOGIN WITH FACEBOOK',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      );
  Widget googleBtn() => FlatButton(
        onPressed: () {
          submit();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          color: Colors.black12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                "https://icons-for-free.com/iconfiles/png/512/color+google+media+network+social+icon-1320086080668511532.png",
                height: 50,
              ),
              Text(
                'CONNECT WITH GOOGLE',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ),
      );
}
