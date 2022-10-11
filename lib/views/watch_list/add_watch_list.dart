part of '../pages.dart';

class AddWatchListPage extends StatefulWidget {
  const AddWatchListPage({super.key});

  static const routeName = '/add_watch_list';

  final String title = 'Add to Watch List';

  @override
  State<AddWatchListPage> createState() => _AddWatchListPageState();
}

class _AddWatchListPageState extends State<AddWatchListPage> {
  final RegExp nonStartingZero = RegExp(r'^0+(?=.)');

  final _formKey = GlobalKey<FormState>();
  final WatchList _watchList = WatchList();

  void _onEmailSaved(String? email) {
    setState(() {
      _watchList.email = email;
    });
  }

  void _onStatusChanged(String? status) {
    setState(() {
      _watchList.status = status;
    });
  }

  void _onEpisodeSaved(String? episode) {
    setState(() {
      _watchList.episode = episode;
    });
  }

  void _onRatingChanged(String? rating) {
    setState(() {
      _watchList.rating = rating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(YumeSpace.medium),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    YumeOutlinedTextField(
                      labelText: 'Email',
                      prefixIcon: YumeIcons.email,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (email) {
                        _onEmailSaved(email);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        } else if (!EmailValidator.validate(value.toString())) {
                          return 'Please enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const YumeVSpacer(
                      space: YumeSpace.medium,
                    ),
                    YumeDropdownTextField(
                      labelText: 'Status',
                      options: WatchStatus.values
                          .map((status) => status.value.toString())
                          .toList(),
                      onChanged: (status) {
                        _onStatusChanged(status);
                      },
                      prefixIcon: YumeIcons.bookmark,
                      onSaved: (status) {
                        _onStatusChanged(status);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a watch status';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const YumeVSpacer(
                      space: YumeSpace.medium,
                    ),
                    YumeOutlinedTextField(
                      labelText: 'Episodes watched',
                      prefixIcon: YumeIcons.checklist,
                      keyboardType: TextInputType.number,
                      onSaved: (episode) {
                        _onEpisodeSaved(episode);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number of episodes watched';
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        FilteringTextInputFormatter.deny(nonStartingZero),
                      ],
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const YumeVSpacer(
                      space: YumeSpace.medium,
                    ),
                    YumeDropdownTextField(
                      labelText: 'Rating',
                      options: Rating.values
                          .map((rating) => rating.value.toString())
                          .toList(),
                      onChanged: (rating) {
                        _onRatingChanged(rating);
                      },
                      prefixIcon: YumeIcons.starRate,
                      onSaved: (rating) {
                        _onRatingChanged(rating);
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a rating';
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ],
                ),
              ),
              const YumeVSpacer(space: YumeSpace.large),
              YumeFilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => YumeDialog(
                          title: 'Save to watch list?',
                          content:
                              'Make sure you have inputted the right data before saving\n\nEmail: ${_watchList.email}\nStatus: ${_watchList.status}\nEpisodes watched: ${_watchList.episode}\nRating: ${_watchList.rating}',
                          dismissLabel: 'Cancel',
                          onDismiss: () {
                            Navigator.pop(context, 'Cancel');
                          },
                          confirmLabel: 'Save',
                          onConfirm: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Added to watch list')),
                            );
                            Navigator.pop(context, 'Save');
                          },
                        ),
                      ).then((value) {
                        if (value == 'Save') Navigator.pop(context);
                      });
                    }
                  },
                  label: 'Save'),
            ],
          ),
        ),
      ),
    );
  }
}
