import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/home.dart';
import 'package:littlewords/shared_pref.provider.dart';
import 'package:littlewords/username.route.dart';

import 'error.route.dart';
import 'loading.route.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'LittleWords',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ref.watch(userNameProvider).when(data: _data, error: _error, loading: _loading ),
    );
  }

  Widget _data(String? username){
    if(null == username){
      return UsernameRoute();
    }
    return const MyHomePage();
  }

  Widget _error(error, stack){
    print(error);
    return const ErrorRoute();
  }

  Widget _loading(){
    return const LoadingRoute();
  }
}
