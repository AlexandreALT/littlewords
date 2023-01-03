import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
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
            builder: (context) => Image.asset('assets/email-balloon.png')));
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
}
