part of 'pages.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.title, required this.anime});

  static const routeName = '/detail';

  final String title;
  final Anime anime;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool _favorite = false;

  void _onFavorite() {
    setState(() {
      _favorite = !_favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.tertiaryContainer,
              ],
            ),
          ),
          child: Column(
            children: [
              Flexible(
                  flex: 3,
                  child: Stack(alignment: Alignment.topRight, children: [
                    Image(
                      image: AssetImage(widget.anime.banner),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: YumeSpace.small,
                        right: YumeSpace.small,
                      ),
                      child: Material(
                        elevation: 2,
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(YumeShape.circle),
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          child: IconButton(
                            onPressed: () {
                              _onFavorite();
                            },
                            icon: _favorite
                                ? const Icon(YumeIcons.favorite)
                                : const Icon(YumeIcons.favoriteOutlined),
                            color: Colors.red,
                          ),
                        ),
                      ),
                    )
                  ])),
              const YumeVSpacer(),
              if (widget.anime.images.isNotEmpty)
                Flexible(
                  flex: 1,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(
                      left: YumeSpace.medium,
                      right: YumeSpace.medium,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.anime.images.length,
                    itemBuilder: ((context, index) {
                      return CardAnimeImage(
                        imagePath: widget.anime.images[index],
                      );
                    }),
                    separatorBuilder: (context, index) {
                      return const YumeHSpacer();
                    },
                  ),
                ),
              const YumeVSpacer(),
              Flexible(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: YumeSpace.medium,
                    right: YumeSpace.medium,
                  ),
                  child: Column(
                    children: [
                      Text(
                        widget.anime.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const YumeVSpacer(),
                      Expanded(
                        child: SingleChildScrollView(
                          child: SafeArea(
                            child: Text(
                              widget.anime.synopsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddWatchListPage.routeName);
        },
        child: const Icon(YumeIcons.playlistAdd),
      ),
    );
  }
}
