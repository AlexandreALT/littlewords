import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/DbHelper.dart';

final wordCountProvider = FutureProvider<int>((ref) async {
  return DbHelper.instance.countWords();
});