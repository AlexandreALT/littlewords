import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/device_location.provider.dart';
import 'package:littlewords/view_message.dart';
import 'package:littlewords/words_around_markerLayer.dart';

class AppMap extends ConsumerWidget {
  AppMap({Key? key}) : super(key: key);

  final mapController = MapController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(deviceLocationProvider).when(
        data: (data) => _onData(data, ref, context),
        error: _onError,
        loading: _onLoading);
  }

  _onData(LatLng? position, WidgetRef ref, BuildContext context) {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
          zoom: 9.2,
          onMapReady: () async {
            if (null == position) return;
            mapController.move(position, 18);
          }),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
      ],
      nonRotatedChildren: [
        MarkerLayer(
          markers: [
            if (position != null)
              Marker(
                  rotate: false,
                  point: position!,
                  width: 80,
                  height: 80,
                  rotateOrigin: Offset(40, 40),
                  rotateAlignment: Alignment(40, 40),
                  builder: (context) => Image.asset(
                        'assets/personne.png',
                        height: 50,
                      )),
          ],
        ),
        IconButton(
            onPressed: () {
              _openViewMessage(context);
            },
            icon: WordsAroundMarkerLayer()),
        Positioned(
          right: 8,
          top: 50,
          child: IconButton(
            icon: Image.asset('assets/location.png'),
            iconSize: 50,
            onPressed: () {
              _openViewMessage(context);
            },
          ),
        ),
      ],
    );
  }

  void _openViewMessage(context) {
    showDialog(
        context: context,
        builder: (context) {
          return ViewMessage();
        });
  }

  Widget _onError(Object error, StackTrace stackTrace) {
    return Container(
      color: Colors.red,
    );
  }

  Widget _onLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
