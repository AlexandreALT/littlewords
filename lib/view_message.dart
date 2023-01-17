import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewMessage extends ConsumerWidget {
  const ViewMessage({Key? key}) : super(key: key);

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
              child: Text('Test'),
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
                Navigator.pop(context);
              },
            ),
          ),
        ]),
      ),
    );
  }
}