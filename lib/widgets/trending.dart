import 'package:entrevista/utils/text.dart';
import 'package:flutter/material.dart';



class TrendingMovies extends StatelessWidget{
 final List trending;

  const TrendingMovies({super.key, required this.trending});
  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,


        children: [
        modified_text(text:'Em Alta', size:18,),
          SizedBox(height: 15,),
          Container(height: 200,
          child: ListView.builder(itemCount: trending.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
            return InkWell(
              onTap:(){

              },
              child: Container(
                padding: EdgeInsets.all(5),
                width: 250,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    trending[index]['backdrop_path']),
                            fit: BoxFit.cover),
                      ),
                      height: 140,
                    ),
                    SizedBox(height: 5),
                    Container(
                      child: modified_text(
                          size: 15,
                          text: trending[index]['original_title'] != null
                              ? trending[index]['original_title']
                              : 'carregando...'),
                    )
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