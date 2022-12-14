import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Menu extends ConsumerWidget{
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 2, color: Colors.black),
              ),
              color: Colors.lightBlue,
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Wrap(
                      children: [
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.green,
                          shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
                          child: Image.asset('assets/new-message.png', height: 35),
                        ),
                        const SizedBox(width: 25),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.green,
                          shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
                          child: Image.asset('assets/message-prive.png', height: 40),
                        ),
                        const SizedBox(width: 60),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.green,
                          shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
                          child: Image.asset('assets/world.png', height: 40),
                        ),
                        const SizedBox(width: 25),
                        FloatingActionButton(
                          onPressed: () {SystemNavigator.pop();},
                          backgroundColor: Colors.green,
                          shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
                          child: Image.asset('assets/deconnexion.png', height: 35),
                        ),
                      ],
                    )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
        ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              shape: const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
              onPressed: () {Navigator.pop(context);},
              child: const Icon(Icons.arrow_drop_down_rounded, size: 55, color: Colors.black,),
            ),
          ),
      ]),
    );
  }
}