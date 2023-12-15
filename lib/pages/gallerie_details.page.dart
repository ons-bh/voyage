import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class GallerieDetailsPage extends StatefulWidget {
  final String keyw;

  GallerieDetailsPage(this.keyw);


  @override
  _GallerieDetailsPageState createState() => _GallerieDetailsPageState();
}

class _GallerieDetailsPageState extends State<GallerieDetailsPage> {
 int currentPage =1;
 int size=10;
 late int totalPages;
 ScrollController _scrollController= new ScrollController();
 List<dynamic>hits=[];
  var gallerieData;

  void initState() {
    super.initState();
    getGallerieData(widget.keyw);
    _scrollController.addListener(() {
      if(_scrollController.position.pixels== _scrollController.position.maxScrollExtent)
    {
      if(currentPage<totalPages){
        currentPage++;
        getGallerieData(widget.keyw);
      }
    }
    });
  }
  void getGallerieData(String keyw) {
    print("Image de " + keyw);
    String url =
        "https://pixabay.com/api/?key=15646595-375eb91b3408e352760ee72c8&q=${keyw} &page=${currentPage}&per_page=${size}";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.gallerieData = json.decode(resp.body);
        hits.addAll(gallerieData['hits']);
        totalPages=(gallerieData['totalHits']/size).ceil();
        print(hits);
      });
    }).catchError((err) {
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  totalPages == 0
          ? Text('Pas de résultats')
            : Text("${widget.keyw}, Page ${currentPage}/${totalPages}"),
      ),
      body: (
      gallerieData == null  ? Center(child: CircularProgressIndicator()):ListView.builder(itemCount: (gallerieData == null? 0: hits.length),
        controller: _scrollController,

        itemBuilder: (context,index){
        return Column(
          children: [

            Container(
              width: double.infinity,
              child: Card(
                child: Text(hits[index]['tags'],style: TextStyle(fontSize: 22,color: Colors.black54,fontWeight: FontWeight.bold,),),
                color: Colors.lightGreen,
              ),
              padding: EdgeInsets.all(10),
            ),

            Container(
              child: Card(
                child: Image.network(
                  hits[index]['webformatURL']
                  ,fit:BoxFit.fitWidth,),
            ),
            padding:EdgeInsets.only(left:10,right:10),)
          ],
        );
        },
      )
      )
    );
  }
 @override
 void dispose() {
   super.dispose();
   _scrollController.dispose();
 }
}


