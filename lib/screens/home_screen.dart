import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yomuy/components/novel_list.dart';
import 'package:yomuy/controllers/db_controller.dart';
import 'package:yomuy/services/narou_service.dart';
import 'package:yomuy/types/novel_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const pageName = "novels";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NarouService narouService;

  final DBController dbController = DBController();

  final List<NovelInfo> _novels = [
    NovelInfo(
      "aa",
      "sample1",
      "story",
      1,
      "userid",
      0,
      0,
      "gensaku",
      "keyword",
      "general_firstup",
      "general_lastup",
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      "novelupdated_at",
      "updated_at",
    )
  ];

  @override
  void initState() {
    super.initState();

    narouService = NarouService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("保存済み小説一覧"),
        actions: [
          IconButton(
            onPressed: () {
              //
              debugPrint("request fetching");
            },
            icon: const Icon(Icons.sync),
          )
        ],
      ),
      body: Center(
        child: NovelList(
          novels: _novels,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Search',
        child: const Icon(Icons.sort),
      ),
    );
  }
}
