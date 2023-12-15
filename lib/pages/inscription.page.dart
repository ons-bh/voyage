import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InscriptionPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController text_login= new TextEditingController();
  TextEditingController text_password= new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('page inscription')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: text_login,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "Identifiant",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius:BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: text_password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined),
                  hintText: "Mot de passe",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius:BorderRadius.circular(10)
                  ),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                    style:ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
                    onPressed:(){
                      _onIscrire(context);
                    }, child: Text('Inscription',style: TextStyle(fontSize: 22))
                )
            ),
            Container(
              child:TextButton(
                  child:Text('J ai deja un compte',style: TextStyle(fontSize: 22)),
                  onPressed:(){
                    Navigator.pop(context);
                    Navigator.pushNamed(context,'/authentification');}),
            )
          ],
        )
    );
  }

  Future<void> _onIscrire(BuildContext context) async {
    prefs =await SharedPreferences.getInstance();
    if(text_login.text.isNotEmpty && text_password.text.isNotEmpty){
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword (
            email: text_login.text.trim(), password: text_password.text.trim()); Navigator.pop(context);
    Navigator.pushNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
    SnackBar snackBar = SnackBar (content: Text("")); if (e.code == 'weak-password') {
    snackBar = SnackBar(
    content: Text('Mot de passe faible'), ); } else if (e.code == 'email-already-in-use') {
    snackBar = SnackBar( content: Text('Email déjà existant'), );
    }
    ScaffoldMessenger.of(context).showSnackBar (snackBar);
    }
    }else{
      const snackBar=SnackBar(content: Text('Id ou mot passe vides'),);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}