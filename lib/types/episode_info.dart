class EpisodeInfo {
  final String ncode;
  final int episodeNo;
  final String title;
  final String postedAt;
  final String refactedAt;

  EpisodeInfo(
      this.ncode, this.episodeNo, this.title, this.postedAt, this.refactedAt);

  factory EpisodeInfo.fromJson(Map<String, dynamic> json) {
    return EpisodeInfo(
      json["ncode"],
      json["episodeNo"],
      json["title"],
      json["posted_at"],
      json["refacted_at"],
    );
  }
}
