import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:littlewords/version_dto.dart';

// Provider d'une instance unique de Dio
// Dio permet de faire des requêtes HTTP
final dioProvider = Provider<Dio>((ref) {

  // On définit les options que l'on souhaite donner à Dio
  var baseOptions = BaseOptions(
    baseUrl: 'https://backend.smallwords.samyn.ovh',
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );

  // Construction de Dio avec les options
  return Dio(baseOptions);
});

// Provider du numéro de version du backend
final backendVersionProvider = FutureProvider<String>((ref) async {
  // On récupère l'instance de Dio
  final dio = ref.read(dioProvider);

  // On fait une requête GET sur l'URL /up
  final response = await dio.get('/up');

  var jsonAsString = response.toString();
  var json = jsonDecode(jsonAsString);
  final VersionDTO versionDTO = VersionDTO.fromJson(json);

  return versionDTO.version;
});