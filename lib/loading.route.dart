import 'package:flutter/material.dart';

class LoadingRoute extends StatelessWidget {
  const LoadingRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
