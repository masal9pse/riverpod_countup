import 'package:flutter/material.dart';
import 'package:riverpod_countup/importer.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.baseColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
          )
        ],
      ),
    );
  }
}