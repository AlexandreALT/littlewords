import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/dio.provider.dart';
import 'package:littlewords/view_message.dart';
import 'package:littlewords/word_dto.dart';
import 'package:littlewords/words_around.provider.dart';

class WordsAroundMarkerLayer extends ConsumerWidget {
  const WordsAroundMarkerLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(wordsAroundProvider).map(data: (data) {
      final List<WordDTO> value = data.value;
      var markers = <Marker>[];
      for (var word in value) {
        markers.add(new Marker(
            point: LatLng(word.latitude!, word.longitude!),
            width: 100,
            height: 100,
            builder: (context) => GestureDetector(
                  child: SizedBox(
                    child: Image.asset('assets/email-balloon.png'),
                    width: 32,
                    height: 32,
                  ),
                  onTap: () {
                    var uid = word.uid.toString();

                    print(uid.toString());

                    var latitude = word.latitude.toString();
                    var longitude = word.longitude.toString();
                    Dio dio = ref.read(dioProvider);
                    dio
                        .get("/word?uid=" +
                            uid +
                            "&longitude=" +
                            longitude +
                            "&latitude=" +
                            latitude)
                        .then((value) {
                      var jsonAsString = value.toString();
                      var json = jsonDecode(jsonAsString);
                      final WordDTO wordDTO = WordDTO.fromJson(json);
                      _openViewMessage(context,wordDTO);
                    });
                    //{ref.refresh(wordsAroundProvider); });
                  },
                )));
      }
      return MarkerLayer(
        markers: markers,
        rotate: false,
      );
    }, error: (error) {
      print(error);
      return Container(
        color: Colors.red.withOpacity(0.5),
      );
    }, loading: (loading) {
      return const Center(child: CircularProgressIndicator());
    });
  }

  void _openViewMessage(context, WordDTO wordDTO) {
    showDialog(
        context: context,
        builder: (context) {
          return ViewMessage(
            content: wordDTO.content!,
          );
        });
  }
}
