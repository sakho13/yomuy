import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:yomuy/components/novel_list.dart';
import 'package:yomuy/components/novel_search_form.dart';
import 'package:yomuy/components/novel_search_result_cell.dart';
import 'package:yomuy/components/scroll_last_detecter.dart';
import 'package:yomuy/services/narou_search_service.dart';
import 'package:yomuy/types/novel_info.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const pageName = "search";

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  NarouSearchService narouSearchService = NarouSearchService();
  final ScrollController _scrollController = ScrollController();
  GlobalKey listViewKey = GlobalKey();

  bool _loading = false;
  bool _refetchable = false;

  List<NovelInfo> novels = [];

  Future<void> _setContents() async {
    final newNovels = await narouSearchService.search();
    setState(() {
      novels = newNovels;
      _refetchable = narouSearchService.refetchable;
    });
    // debugPrint(novels.length.toString());
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> _fetchNextNovels() async {
    debugPrint(_loading.toString());
    if (!_loading) {
      // ローディング中
      setState(() {
        _loading = true;
      });

      debugPrint("検索");

      final newNovels = await narouSearchService.search();
      // debugPrint(newNovels.toString());
      setState(() {
        novels.addAll(newNovels);
        _refetchable = narouSearchService.refetchable;
      });

      setState(() {
        _loading = false;
      });
    }
  }

  void _showSearchModal() {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        child: NovelSearchForm(
          narouSearchService: narouSearchService,
          runAction: _setContents,
        ),
        onWillPop: () async => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("検索画面"),
        actions: [
          IconButton(
            onPressed: () {
              context.push("/novels/settings");
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),

      body: Center(
        child: novels.isNotEmpty
            ? FutureBuilder(
                builder: (context, snapshot) {
                  return ListView.builder(
                    key: listViewKey,
                    controller: _scrollController,
                    itemCount: novels.length,
                    itemBuilder: (context, index) {
                      final tile =
                          NovelSearchResultCell(novelInfo: novels[index]);
                      // debugPrint("$index, ${novels.length}");
                      // debugPrint("$_refetchable");
                      return Column(
                        children: index == novels.length - 1 && _refetchable
                            ? [
                                tile,
                                _loading
                                    ? const CircularProgressIndicator()
                                    : ScrollLastDetecter(
                                        scrollController: _scrollController,
                                        listViewKey: listViewKey,
                                        action: _fetchNextNovels,
                                      )
                              ]
                            : [tile],
                      );
                    },
                  );
                },
              )
            : const Text("検索結果がありません。"),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _showSearchModal,
        tooltip: 'Search',
        child: const Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
