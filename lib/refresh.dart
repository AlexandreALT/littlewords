import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/words_around.provider.dart';

class Refresh extends ConsumerWidget {
  Refresh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        icon: Image.asset('assets/rafraichir.png'),
        iconSize: 50,
        onPressed: () {
          ref.refresh(wordsAroundProvider);
        },
      );
  }
}
