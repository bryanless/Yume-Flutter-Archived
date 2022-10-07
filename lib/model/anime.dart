import 'package:yume_flutter/util/file_path.dart';

class Anime {
  String title;
  String synopsis;
  String banner;
  List<String> images;

  Anime({
    required this.title,
    required this.synopsis,
    required this.banner,
    required this.images,
  });
}

var animes = [
  Anime(
    title: 'Seishun Buta Yarou (Shinsaku Anime)',
    synopsis:
        "Seishun Buta Yarou wa Odekake Sister no Yume wo Minai (Rascal Does Not Dream of a Sister Venturing Out)\n\nWHAT WILL IT TAKE TO MAKE HER WISH COME TRUE?\n\nAfter a draining December, Sakuta is quickly nearing the end of his second year of high school. Since Mai is a third-year student, they don't have much time left together before graduation rolls around. Meanwhile, his sister, Kaede, is slowly but steadily venturing outdoors again. Just as she begins to find her footing, she announces her most ambitious goal yet—attending her brother's high school! Sakuta knows better than anyone how difficult this will be for Kaede, and he's ready to support her however he can. He's just not sure if that's what's best for her...or what she really wants...\n\nSeishun Buta Yarou wa Randoseru Girl no Yume wo Minai (Rascal Does Not Dream of a Knapsack Kid)\n\nFinally, the day of Mai's high school graduation has arrived. While Sakuta eagerly waits for his girlfriend, an elementary schooler who looks exactly like her appears before him. Suspicious, and for all the wrong reasons... Meanwhile, Sakuta and Kaede's father suddenly calls, saying that their mother wants to see her daughter. She was hospitalized because Kaede's condition had been too much for her to bear, so what could she possibly want now? (Source: Yen Press)",
    banner: '${FilePath.images}/${FilePath.aobuta}/aobuta_banner.jpeg',
    images: [
      '${FilePath.images}/${FilePath.aobuta}/aobuta_anime_ln_8.jpeg',
      '${FilePath.images}/${FilePath.aobuta}/aobuta_anime_ln_9.jpeg',
      '${FilePath.images}/${FilePath.aobuta}/aobuta_ln_8.jpeg',
      '${FilePath.images}/${FilePath.aobuta}/aobuta_ln_9.jpeg',
    ],
  )
];
