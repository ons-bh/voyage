import 'package:atelier3/pages/gallerie_details.page.dart';
import 'package:flutter/material.dart';

class GalleriePage extends StatelessWidget {
  final TextEditingController txt_gallerie = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('page Gallerie')),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: txt_gallerie,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.image),
                    hintText: 'KeyWord',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: () {
                    _onGetGallerieDelaits(context);
                  },
                  child: Text('Chercher', style: TextStyle(fontSize: 22))),
            ),

          ],
        )
        );
  }

  void _onGetGallerieDelaits(BuildContext context) {
    String g=txt_gallerie.text;
    Navigator.push(context,
        MaterialPageRoute(
            builder: (context)=> GallerieDetailsPage(g)
        ));
    txt_gallerie.text="";
  }
}