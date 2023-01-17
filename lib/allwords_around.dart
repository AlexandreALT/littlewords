import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/word.dart';
import 'package:littlewords/word_dto.dart';

import 'allwords_around.provider.dart';

class allWords extends ConsumerWidget {
  const allWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var word = new WordDTO(null, 'Louis', 'content', 250, 500);

    final LatLng wordPosition = LatLng(word.latitude!, word.longitude!);
    LatLng? position;

    final Distance distance = new Distance();
    final double meter = distance(wordPosition, position!);

    return Scaffold(
      appBar: AppBar(),
      body: ref
          .watch(allWordsAroundProvider)
          .when(data: _onData, error: _onError, loading: _onLoading),
    );
  }

  Widget? _onData(List<WordDTO> data) {
    var words = <Word>[];
    data.forEach((WordDTO word) => words.add(Word(word: word)));
    return ListView(children: words);
  }

  Widget? _onError(Object error, StackTrace stackTrace) {
    print(error);
  }

  Widget? _onLoading() {
    return Center(child: CircularProgressIndicator(),);
  }
}
