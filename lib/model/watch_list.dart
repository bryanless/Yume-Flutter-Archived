class WatchList {
  String? status;
  String? episode;
  String? rating;

  WatchList({
    this.status,
    this.episode,
    this.rating,
  });
}

enum WatchStatus {
  planToWatch('Plan to Watch'),
  watching('Watching'),
  completed('Completed'),
  onHold('On-Hold'),
  dropped('Dropped');

  const WatchStatus(this.value);
  final String value;
}

enum Rating {
  unknown('-'),
  one('1'),
  two('2'),
  three('3'),
  four('4'),
  five('5'),
  six('6'),
  seven('7'),
  eight('8'),
  nine('9'),
  ten('10');

  const Rating(this.value);
  final String value;
}
