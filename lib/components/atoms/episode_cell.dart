import 'package:flutter/material.dart';
import 'package:yomuy/types/chapter_info.dart';
import 'package:yomuy/types/episode_info.dart';

class EpisodeCell extends StatefulWidget {
  const EpisodeCell({Key? key, required this.episodeInfo, this.chapterInfo})
      : super(key: key);

  final EpisodeInfo episodeInfo;
  final ChapterInfo? chapterInfo;

  @override
  State<EpisodeCell> createState() => _EpisodeCellState();
}

class _EpisodeCellState extends State<EpisodeCell> {
  @override
  Widget build(BuildContext context) {
    return _episodeCell();
  }

  _episodeCell() {
    final episode = ListTile(
      title: Text(widget.episodeInfo.title),
    );
    if (widget.chapterInfo != null) {
      final List<Widget> chapterEpisode = [];
      chapterEpisode.add(Text(widget.chapterInfo!.title));
      chapterEpisode.add(episode);
      return chapterEpisode;
    } else {
      return episode;
    }
  }
}
