import 'package:entrevista/main.dart';
import 'package:entrevista/pages/Resultado2.dart';
import 'package:entrevista/utils/text.dart';
import 'package:entrevista/widgets/popular.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, poster_path, vote, launch_on;

  @override
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerurl,
      required this.poster_path,
      required this.vote,
      required this.launch_on});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: ListView(children: [
        Container(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  bannerurl,
                  fit: BoxFit.cover,
                ),
              )),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
            Row(
              children: [
                Container(padding: EdgeInsets.symmetric(horizontal: 130,vertical: 10),
                  child: modified_text(text: name!=null?name:'original_title', size: 20,),
                )
              ],
            ),
            Row(
              children: [
                Container(padding: EdgeInsets.only(top: 3,left:140),
                  child: Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )
                ),
                Container(padding: EdgeInsets.only(left: 3,top:4,right:20),
                  child: modified_text(text: '' + vote, size:18,),
                ),
                Container(
                      child: Icon(
                        Icons.calendar_month,
                        color: Colors.white,
                      )
                ),
                Container(padding: EdgeInsets.only(left: 3,),
                child: modified_text(text:launch_on , size: 14,),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 20,right: 10,bottom: 10,top:50),
              child: modified_text(text: description,size: 16,),
            )
      ])),
    );
  }
}
