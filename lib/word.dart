import 'package:flutter/material.dart';
import 'package:littlewords/word_dto.dart';

class Word extends StatelessWidget {
  const Word({Key? key, required this.word}) : super(key: key);

  final WordDTO word;
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: [
          Text(word.author!),
          Text(word.content!),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
            child: Image.asset('assets/delete.png', height: 35),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.green,
            shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
            child: Image.asset('assets/email-balloon.png', height: 35),
          ),
        ]
    );
  }
}
