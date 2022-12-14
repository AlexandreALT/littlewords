import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:littlewords/word_dto.dart';
import 'package:location/location.dart';

import 'error.route.dart';
import 'loading.route.dart';
import 'menu.dart';

void main() {
  runApp(const ProviderScope(child: MyApp2()));
}

class MyApp2 extends ConsumerWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Flutter Demo',
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LittleWords',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
