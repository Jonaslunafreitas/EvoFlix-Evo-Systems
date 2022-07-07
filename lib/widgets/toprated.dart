import 'package:entrevista/utils/text.dart';
import 'package:flutter/material.dart';



class TopRated extends StatelessWidget{
  final List toprated;

  const TopRated({super.key, required this.toprated});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,


        children: [
          modified_text(text:'Melhores Avaliações', size:18,),
          SizedBox(height: 15,),
          Container(height: 200,
            child: ListView.builder(itemCount: toprated.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap:(){

                    },
                    child: Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(

                            height:200,
                            decoration: BoxDecoration(image: DecorationImage(
                                image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500'+toprated[index]['poster_path']
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