import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/device_location.provider.dart';
import 'package:littlewords/word_dto.dart';
import 'package:littlewords/words_around.provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dio.provider.dart';

class ValidButtonMessage extends ConsumerWidget {
  ValidButtonMessage({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(deviceLocationProvider).when(
        data: (data) => _onData(data, controller, ref, context),
        error: _onError,
        loading: _onLoading);
  }

  Widget _onData(LatLng? data, TextEditingController controller, ref,
      BuildContext context) {
    // si null

    return FloatingActionButton(
        backgroundColor: Colors.green,
        shape:
            const CircleBorder(side: BorderSide(color: Colors.black, width: 2)),
        child: Image.asset('assets/new-message.png', height: 35),
        onPressed: () async {
          var instance = await SharedPreferences.getInstance();
          final String? username = instance.getString('username');
          var location = data;
          final String content = controller.text;
          print(location!.latitude.toString() +
              ':' +
              location.longitude.toString());
          final word = new WordDTO(
              null, username, content, location!.latitude, location.longitude);
          Dio dio = ref.read(dioProvider);
          print('author : ' + word.author.toString());
          print('content : ' + word.content.toString());
          print('latitude : ' + word.latitude.toString());
          print('longitude : ' + word.longitude.toString());
          dio.post('/word', data: {
            'content': word.content.toString(),
            'author': word.author.toString(),
            'latitude': word.latitude,
            'longitude': word.longitude
          }).then((value) {
            ref.refresh(wordsAroundProvider);
            Navigator.pop(context);
          });
        });
  }

  Widget _onError(Object error, StackTrace stackTrace) {
    return Text('Impossible de récuperer la position du téléphone');
  }

  Widget _onLoading() {
    return CircularProgressIndicator();
  }
}
