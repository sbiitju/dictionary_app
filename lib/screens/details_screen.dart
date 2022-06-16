import 'package:dictionary/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../model/word_response.dart';

class DetailsScreen extends StatelessWidget {
  final List<WordResponse> words;

  DetailsScreen(this.words);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              title: Center(child: Text(words[index].word.toString())),
              subtitle: Text(words[index]
                  .meanings![0]
                  .definitions![0]
                  .definition
                  .toString()),
            );
          },
          itemCount: words.length,
          separatorBuilder: (context, index) {
            return const Divider(
              color: Colors.amber,
            );
          },
        ));
  }
}
