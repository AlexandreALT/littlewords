import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/menu.dart';
import 'package:littlewords/word_dto.dart';
import 'package:location/location.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final mapController = MapController();

  LatLng? position;
  final List<WordDTO> words = <WordDTO>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
                zoom: 9.2,
                onMapReady: () async {
                  Location location = Location();

                  PermissionStatus? _permissionGranted;
                  LocationData? locationData;

                  bool _serviceEnabled = await location.serviceEnabled();

                  if (!_serviceEnabled) {
                    _serviceEnabled = await location.requestService();
                    if (!_serviceEnabled) {
                      return;
                    }
                  }

                  _permissionGranted = await location.hasPermission();
                  if (_permissionGranted == PermissionStatus.denied) {
                    _permissionGranted = await location.requestPermission();
                    if (_permissionGranted != PermissionStatus.granted) {
                      return;
                    }
                  }

                  locationData = await location.getLocation();
                  setState(() {
                    position = LatLng(locationData!.latitude!, locationData.longitude!);
                  });

                  mapController.move(
                      position!, 18);
                }),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  if (position != null) Marker(point: position!, width:80, height: 80, builder:  (context) => Image.asset('assets/personne.png', height: 50,)),
                  for (var w in words)
                    Marker(
                      point: LatLng(w.latitude!, w.longitude!),
                      width: 80,
                      height: 80,
                      builder: (context) => const FlutterLogo(),
                    ),
                ],
              ),
            ],
          ),
          Positioned(right: 8,top: 50,child: IconButton(
            icon: Image.asset('assets/location.png'),
            iconSize: 50,
            onPressed: () {},
          ),)
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