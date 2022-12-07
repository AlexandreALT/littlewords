import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Menu extends ConsumerWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: null,
          ),
          const SizedBox(height: 5),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Wrap(
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  child: null,
                ),
                const SizedBox(width: 25),
                FloatingActionButton(
                  onPressed: () {},
                  child: null,
                ),
                const SizedBox(width: 60),
                FloatingActionButton(
                  onPressed: () {},
                  child: null,
                ),
                const SizedBox(width: 25),
                FloatingActionButton(
                  onPressed: () {},
                  child: null,
                ),
              ],
            )
            ],
          ),
          const SizedBox(height: 20),
        ],
      );
  }
}