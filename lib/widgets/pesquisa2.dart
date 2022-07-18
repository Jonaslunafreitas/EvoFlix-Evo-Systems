import 'package:entrevista/utils/text.dart';
import 'package:flutter/material.dart';

import '../description.dart';

class Pesquisa extends StatelessWidget {
  final List pesquisa;

  const Pesquisa({super.key, required this.pesquisa});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        modified_text(
          text: '',
          size: 18,
        ),
        SizedBox(
          height: 15,
          width: 15,
        ),
        Container(
            height: 619,
            child: GridView.builder(
                itemCount: pesquisa.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: pesquisa[index]['title'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      pesquisa[index]['backdrop_path'],
                                  poster_path:
                                      'https://image.tmdb.org/t/p/w500' +
                                          pesquisa[index]['poster_path'],
                                  description: pesquisa[index]['overview'],
                                  vote: pesquisa[index]['vote_average']
                                      .toString(),
                                  launch_on: pesquisa[index]['release_date'])));
                    },
                    child: pesquisa[index]['title'] != null
                        ? Container(
                            width: 140,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500' +
                                                pesquisa[index]
                                                    ['poster_path'])),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                          child: modified_text(
                              size: 15,
                              text: pesquisa[index]['original_title'] != null
                                  ? pesquisa[index]['original_title']
                                  : pesquisa[index]['name']),
                    ),
                  );
                }))
      ]),
    );
  }
}
