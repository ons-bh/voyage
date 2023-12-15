import 'package:atelier3/notifier/theme.dart';
import 'package:flutter/material.dart';
class GlobalParams{
  static List<Map<String,dynamic>>menus=[
  {"title":"Accueil"," icon":Icon(Icons.home,color: Colors.lightGreen),"route": "/home"},
{"title":"Meteo"," icon":Icon(Icons.ac_unit,color: Colors.lightGreen),"route": "/meteo"},
{"title":"Gallerie"," icon":Icon(Icons.add_a_photo_sharp,color: Colors.lightGreen),"route": "/gallerie"},
{"title":"Pays"," icon":Icon(Icons.abc_outlined,color: Colors.lightGreen),"route": "/pays"},
{"title":"Contact"," icon":Icon(Icons.add_call,color: Colors.lightGreen),"route": "/contact"},
{"title":"Parametres"," icon":Icon(Icons.add_chart_outlined,color: Colors.lightGreen),"route": "/parametre"},
{"title":"Deconnexion"," icon":Icon(Icons.account_circle_outlined,color: Colors.lightGreen),"route": "/authentification"},
];
  static List<Map<String,dynamic>>accueil=[
    {"image": AssetImage('images/meteo.png'),"height":"180","width": "180","route": "/meteo"},
    {"image": AssetImage('images/contact.png'),"height":"180","width": "180","route": "/contact"},
    {"image": AssetImage('images/gallerie.png'),"height":"180","width": "180","route": "/gallerie"},
    {"image": AssetImage('images/parametres.png'),"height":"180","width": "180","route": "/parametre"},
    {"image": AssetImage('images/pays.png'),"height":"180","width": "180","route": "/pays"},
    {"image": AssetImage('images/deconnexion.png'),"height":"180","width": "180","route": "/authentification"},

  ];
  static MonTheme themeActuel=MonTheme();

}