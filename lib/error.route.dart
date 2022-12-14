import 'package:flutter/material.dart';

class ErrorRoute extends StatelessWidget {
  const ErrorRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text(
            'Impossible de récupérer le username',
            style: TextStyle(color: Colors.white),
          ),
        )
      );
  }
}
