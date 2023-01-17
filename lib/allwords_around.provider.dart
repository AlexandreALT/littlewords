import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/DbHelper.dart';
import 'package:littlewords/word_dto.dart';

final allWordsAroundProvider = FutureProvider<List<WordDTO>>(((ref) async {
  DbHelper instance = DbHelper.instance;
  List<WordDTO> words = await instance.getAllWordsAround();
  return words;
}));