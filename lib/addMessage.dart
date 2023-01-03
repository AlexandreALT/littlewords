import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddMessage extends ConsumerWidget {
  const AddMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Stack(children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/lettre.png', height: 340),
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
          child: FloatingActionButton(
            backgroundColor: Colors.green,
            shape: const CircleBorder(
                side: BorderSide(color: Colors.black, width: 2)),
            child: Image.asset('assets/new-message.png', height: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ]),
    );
  }
}
