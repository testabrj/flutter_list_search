import 'package:flutter/material.dart';
import 'package:flutter_app_test/helpers/Constants.dart';
import 'package:flutter_app_test/pages/UserListPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatelessWidget {
  final _pinCodeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _storage = FlutterSecureStorage();

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

    void saveLoginTime() async {
      final loginTime = DateTime.now().toString();
      await _storage.write(key: lastLoginTime, value: loginTime);
      print("LoginTimeSaved="+loginTime);

    }

    final loginButton = Padding(
      padding:EdgeInsets.symmetric(vertical:16.0,horizontal: 16.0),
      child:RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),

        ),
        onPressed:(){
          if(_formKey.currentState.validate()){
//            Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processing data")));
            saveLoginTime();
            Navigator.of(context).pushReplacementNamed(userListPageTag);
          }
        } ,
        padding:EdgeInsets.all(12),
        color: appGreyColor,
        child:Text(loginButtonText,style:TextStyle(color:Colors.white)),

      ),

    );

    final form = Form(
        key: _formKey,
        child:Center( child:Card(
          margin: EdgeInsets.all(16),
          elevation: 5,
          child:
          Column(

            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,

            children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
                  child:TextFormField(

                      decoration: InputDecoration(hintText: "Enter your name",labelText: "Username*"),
                      validator: (value){
                        if(value.isEmpty){
                          return 'Please Enter a Name';
                        }
                        else if(value != "rtbuser") {
                          return 'Invalid user name';
                        }
                        return null;
                      })),
              Padding( padding:EdgeInsets.only(left: 10,right: 10,bottom: 20),child:TextFormField(
                  decoration: InputDecoration(hintText: "Enter Password",labelText: "Password*"),
                  validator: (value){
                    if(value.isEmpty){
                      return 'Please Enter a Password';
                    }
                   else  if(value!= 'rtblogin') {
                      return 'Invalid password';
                    }
                    return null;

                  })),
//              Padding(padding: EdgeInsets.only(top: 10,bottom: 10),
//                  child: Builder(builder: (context)=> RaisedButton(
//                    color: Colors.blue,
//                    padding: EdgeInsets.all(10),
//                    onPressed: (){
//                      if(_formKey.currentState.validate()){
//                        Scaffold.of(context).showSnackBar(SnackBar(content: Text("Processing data")));
//                        Navigator.of(context).pushNamed(dashboardPageTag);
//                      }
//                    },
//                    child: Text("submit",style: TextStyle(color: Colors.white,fontSize: 16),),
//                  )
//                  )),

            ],
          ) ,

        )
        )
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
            form,
            SizedBox(height:buttonHeight),
            loginButton
          ],
        )
      )
    );
  }


}