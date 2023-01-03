import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/app_map.dart';
import 'package:littlewords/menu.dart';
import 'package:littlewords/word_dto.dart';
import 'package:littlewords/words_around_markerLayer.dart';
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage

  ({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mapController = MapController();

  LatLng? position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppMap()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return FloatingActionButton(
            tooltip: 'Menu',
            backgroundColor: Colors.lightBlue,
            onPressed: _openMenu,
            shape: const CircleBorder(
                side: BorderSide(color: Colors.black, width: 2)),
            child: const Icon(
              Icons.arrow_drop_up_rounded,
              size: 55,
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  void _openMenu() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return const Menu();
        });
  }
}
