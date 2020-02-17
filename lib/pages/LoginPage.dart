import 'package:flutter/material.dart';
import 'package:flutter_app_test/helpers/Constants.dart';

class LoginPage extends StatelessWidget {
  final _pinCodeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final logo = new CircleAvatar(
      backgroundColor:Colors.transparent ,
      radius:bigRadius,
      child:appLogo
    );

    final pinCode = TextFormField(
      controller: _pinCodeController,
      keyboardType: TextInputType.phone,
      maxLength: 4,
      maxLines: 1,
      autofocus: true,
      decoration: InputDecoration(
        hintText: pinCodeHintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20,10),
        border:OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0)
        ),
        hintStyle:TextStyle(
          color: Colors.white
        )
      ),
      style: TextStyle(
        color: Colors.white
      ),
    );

    final loginButton = Padding(
      padding:EdgeInsets.symmetric(vertical:16.0),
      child:RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),

        ),
        onPressed:(){Navigator.of(context).pushNamed(userListPageTag);} ,
        padding:EdgeInsets.all(12),
        color: appGreyColor,
        child:Text(loginButtonText,style:TextStyle(color:Colors.white)),

      ),

    );



    return Scaffold(
      backgroundColor: appDarkGreyColor,
      body:Center(
        child:ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left:24,right:24),
          children: <Widget>[
            logo,
            SizedBox(height: bigRadius),
            pinCode,
            SizedBox(height:buttonHeight),
            loginButton
          ],
        )
      )
    );
  }


}