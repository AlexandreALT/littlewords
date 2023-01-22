import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:littlewords/DbHelper.dart';
import 'package:littlewords/word_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Word extends StatelessWidget {
  const Word({Key? key, required this.word}) : super(key: key);

  final WordDTO word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            word.author ?? 'Inconnu',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.black,
          height: 3,
        ),
        SizedBox(height: 10),
        Align(
          alignment: Alignment.centerLeft,
          child: TextFormField(
            maxLines: 5,
            maxLength: 200,
            initialValue: word.content ?? 'Pas de contenu',
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
          ),
        ),
        Row(children: [
          SizedBox(
            width: 15,
          ),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.green,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2)),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/email-balloon.png'),
            ),
          ),
          SizedBox(width: 30),
          Ink(
            decoration: ShapeDecoration(
              color: Colors.green,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2)),
            ),
            child: IconButton(
              onPressed: () {
                DbHelper.instance.delete(word);
              },
              icon: Image.asset('assets/delete.png'),
            ),
          ),
        ]),
      ]),
    );
  }
}
