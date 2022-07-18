import 'package:entrevista/pages/resultado.dart';
import 'package:entrevista/utils/text.dart';
import 'package:flutter/material.dart';

import '../description.dart';
import '../pages/teste.dart';



class TV extends StatelessWidget{
  final List tv;

  const TV({super.key, required this.tv});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,


        children: [
          modified_text(text:'Series Populares', size:18,),
          SizedBox(height: 15,),
          Container(height: 200,
            child: ListView.builder(itemCount: tv.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      },
                    child:
                    Container(
                      width: 140,
                      child:
                      Column(
                        children: [
                          Container(
                            height:200,
                            decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+tv[index]['poster_path']
                                )
                            ),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              color: Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }) ,)
        ],

      ),
    );
  }
}