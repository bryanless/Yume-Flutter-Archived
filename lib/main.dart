import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:yume_flutter/model/anime.dart';
import 'package:yume_flutter/theme/theme.dart';

import 'views/pages.dart';

void main() {
  runApp(const YumeApp());
}

class YumeApp extends StatelessWidget {
  const YumeApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: 'Yume',
          theme: YumeTheme.lightTheme(lightColorScheme),
          darkTheme: YumeTheme.darkTheme(darkColorScheme),
          home: DetailPage(
            title: 'Detail',
            anime: animes.first,
          ),
        );
      },
    );
  }
}
