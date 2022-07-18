import 'package:entrevista/main.dart';
import 'package:entrevista/widgets/pesquisa2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Teste extends StatefulWidget {
  const Teste({Key? key}) : super(key: key);

  @override
  State<Teste> createState() => _TesteState();
}

class _TesteState extends State<Teste> {
  List pesquisa = [];
  final TextEditingController buscaController = TextEditingController();
  final String apikey = '3c3b3d0d86f4309961a0c56119c43b2b';
  final readacesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIzYzNiM2QwZDg2ZjQzMDk5NjFhMGM1NjExOWM0M2IyYiIsInN1YiI6IjYyYzQ5Y2E3YTMxM2I4MDA1OTYzMjMxNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.TDgE_25TRpsHKnsIeQuaCer-Uy0OvJjApEVuX3rvaJU';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.black87,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
          child: Icon(
            Icons.home,
            color: Colors.white,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://raw.githubusercontent.com/Jonaslunafreitas/Lunaflix-Evo-Systems-/master/evoflix%20(1).png',
              fit: BoxFit.contain,
              height: 200,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 10, right: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: buscaController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'O que você está buscando?',
                  suffixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 0.5,
                    child: Icon(
                      Icons.search,
                    ),
                  )),
              onSubmitted: onSubmitted,
            ),
            Pesquisa(pesquisa: pesquisa),
          ],
        ),
      ),
    );
  }

  void onSubmitted(String text) async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readacesstoken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map pesquisaresult = await tmdbWithCustomLogs.v3.search.queryMulti(text);
    setState(() {
      pesquisa = pesquisaresult['results'];
    });

    print(pesquisa);
    print(text);
  }
}
