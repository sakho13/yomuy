import 'package:flutter/material.dart';
import 'package:yomuy/components/atoms/episode_cell.dart';
import 'package:yomuy/types/episode_info.dart';

class EpisodeList extends StatefulWidget {
  const EpisodeList({Key? key, required this.episodes}) : super(key: key);

  final List<EpisodeInfo> episodes;

  @override
  State<EpisodeList> createState() => _EpisodeListState();
}

class _EpisodeListState extends State<EpisodeList> {
  @override
  Widget build(BuildContext context) {
    if (widget.episodes.isEmpty) {
      return const Center(
        child: Text("小説が存在しません。"),
      );
    } else {
      return ListView.builder(
        itemCount: widget.episodes.length,
        itemBuilder: (context, index) =>
            EpisodeCell(episodeInfo: widget.episodes[index], chapterInfo: null),
      );
    }
  }
}
