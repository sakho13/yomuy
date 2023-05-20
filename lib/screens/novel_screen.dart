import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yomuy/services/narou_service.dart';
import 'package:yomuy/types/episode_info.dart';
import 'package:yomuy/types/novel_info.dart';

class NovelScreen extends StatefulWidget {
  const NovelScreen({Key? key, required this.ncode}) : super(key: key);

  final String ncode;

  @override
  State<NovelScreen> createState() => _NovelScreenState();
}

class _NovelScreenState extends State<NovelScreen> {
  final NarouService narouService = NarouService();

  List<EpisodeInfo> episodes = [];

  @override
  void initState() {
    super.initState();

    try {
      narouService.init(widget.ncode);
      episodes = narouService.fetchEpisodes();
    } catch (e) {
      context.go("/novels");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ncode),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      body: Center(
        child: ListView(
          children: [],
        ),
      ),
    );
  }
}
