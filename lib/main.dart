

import 'package:atelier3/config/global.params.dart';
import 'package:atelier3/pages/contact.page.dart';
import 'package:atelier3/pages/gallerie.page.dart';
import 'package:atelier3/pages/home.page.dart';
import 'package:atelier3/pages/inscription.page.dart';
import 'package:atelier3/pages/meteo.page.dart';
import 'package:atelier3/pages/parametre.page.dart';
import 'package:atelier3/pages/pays.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:atelier3/pages/authentification.page.dart';

import 'firebase_options.dart';
ThemeData theme=
 ThemeData(primarySwatch:Colors.lightGreen);

//ThemeData theme= ThemeData.light();
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _onGetMode();
  GlobalParams.themeActuel.setMode(await _onGetMode());
  runApp (MyApp());}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
  class _MyAppState extends State<MyApp>{
    final routes = {
      '/home': (context) => HomePage(),
      '/inscription': (context) => InscriptionPage(),
      '/authentification': (context) => AuthentificationPage(),
      '/meteo':(context)=> MeteoPage(),
      '/pays':(context)=>PaysPage(),
      '/contact':(context)=>ContactPage(),
      '/gallerie':(context)=>GalleriePage(),
      '/parametre':(context)=>ParametrePage()

    };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,

      routes: routes,
      theme: GlobalParams.themeActuel.getTheme(),
      home:StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges (),
    builder: (context, snapshot) {
    if(snapshot.hasData)
    return HomePage();
    else
    return AuthentificationPage();
    }),);
  }
  @override
  void initState(){
    super.initState();
    GlobalParams.themeActuel.addListener(() {
      setState((){});
  });

}}
Future<String>_onGetMode() async {
  final snapshot = await ref.child('mode').get();
  if (snapshot.exists)
    mode = snapshot.value.toString();
  else
    mode = "Jour";
  print (mode);
  return (mode);}