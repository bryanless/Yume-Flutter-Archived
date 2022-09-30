import 'package:flutter/material.dart';

class YumeHSpacer extends StatelessWidget {
  const YumeHSpacer({super.key, this.space = 8});

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: space,
    );
  }
}

class YumeVSpacer extends StatelessWidget {
  const YumeVSpacer({super.key, this.space = 8});

  final double space;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: space,
    );
  }
}
