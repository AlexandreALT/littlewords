import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/device_location.provider.dart';
import 'package:littlewords/dio.provider.dart';
import 'package:littlewords/valid_btn_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'word_dto.dart';

class AddMessage extends ConsumerWidget {
  AddMessage({Key? key}) : super(key: key);

  final _ctrl = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: TextField(
                controller: _ctrl,
                maxLines: 5,
                maxLength: 200,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Écrivez votre message ici',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.5, 0.65),
            child: FloatingActionButton(
              backgroundColor: Colors.green,
              shape: const CircleBorder(
                  side: BorderSide(color: Colors.black, width: 2)),
              child: Image.asset('assets/annuler.png', height: 35),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment(0.5, 0.65),
            child: ValidButtonMessage(controller: _ctrl)
          ),
        ]),
      ),
    );
  }
}
