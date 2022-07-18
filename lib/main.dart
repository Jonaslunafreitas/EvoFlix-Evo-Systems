import 'package:entrevista/pages/Resultado2.dart';
import 'package:entrevista/widgets/avaliado.dart';
import 'package:entrevista/widgets/emalta.dart';
import 'package:entrevista/widgets/popular.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.black45),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  final String apikey = '3c3b3d0d86f4309961a0c56119c43b2b';
  final readacesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzNiM2QwZDg2ZjQzMDk5NjFhMGM1NjExOWM0M2IyYiIsInN1YiI6IjYyYzQ5Y2E3YTMxM2I4MDA1OTYzMjMxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TDgE_25TRpsHKnsIeQuaCer-Uy0OvJjApEVuX3rvaJU';

  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  loadmovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readacesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map trendingresult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvresult = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Teste()));
          },
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/Jonaslunafreitas/Lunaflix-Evo-Systems-/master/evoflix%20(1).png',
              fit: BoxFit.contain,
              height: 210,
            ),
            Container()
          ],
        ),
      ),
      body: ListView(
        children: [
          EmAlta(trending: trendingmovies),
          Avaliado(toprated: topratedmovies),
          Popular(tv: tv),
        ],
      ),
    );
  }
}
