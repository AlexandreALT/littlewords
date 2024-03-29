import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/DbHelper.dart';
import 'package:littlewords/refresh.dart';
import 'package:littlewords/word.dart';
import 'package:littlewords/word_dto.dart';

import 'all_words.provider.dart';

class allWords extends ConsumerWidget {
  const allWords({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var word = new WordDTO(null, 'Louis', 'content', 250, 500);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Ink(
                decoration: ShapeDecoration(
                  color: Colors.blue,
                  shape: CircleBorder(side: BorderSide(color: Colors.black, width: 2),),
                ),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.arrow_left_rounded,size: 35,color: Colors.black,),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: ref
          .watch(allWordsProvider)
          .when(data: _onData, error: _onError, loading: _onLoading),
      floatingActionButton: FloatingActionButton(
        child: Text("+"),
        onPressed: () {
          DbHelper.instance.insert(word);
        },
      ),
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
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
