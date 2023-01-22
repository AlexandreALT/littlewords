import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/DbHelper.dart';
import 'package:littlewords/valid_btn_message.dart';
import 'package:littlewords/word_dto.dart';

class ViewMessage extends ConsumerWidget {
  ViewMessage({Key? key, required this.word}) : super(key: key);

  final WordDTO word;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ctrl = TextEditingController(text: word.content);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: SizedBox(
        child: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/lettre.png', height: 340),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50, bottom: 128),
              child: TextFormField(
                controller: _ctrl,
                maxLines: 5,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: 'Écrivez votre message ici',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.75, 0.65),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2)),
              child: Image.asset('assets/delete.png', height: 35),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment(0, 0.65),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2)),
              child: Image.asset('assets/diskette.png', height: 30),
              onPressed: () {
                DbHelper.instance.insert(word);
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment(0.75, 0.65),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2)),
              child: Image.asset('assets/hand.png', height: 45),
              onPressed: () {
                ValidButtonMessage(controller: _ctrl,);
              },
            ),
          ),
        ]),
      ),
    );
  }
}