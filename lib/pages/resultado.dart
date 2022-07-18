import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/pesquisa2.dart';

class Resultado extends StatelessWidget {
  Resultado({Key? key}) :super(key: key);
  final TextEditingController buscaController = TextEditingController();
  List pesquisa = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.search,
                    ),
                  )
              ),
              onSubmitted: onSubmitted,
            ),
            Pesquisa(pesquisa: pesquisa),
          ],
        ),
      ),
    );
  }


  void onSubmitted(String text) async {

    print(text);
  }
}
