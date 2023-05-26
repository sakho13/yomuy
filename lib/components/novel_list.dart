import 'package:flutter/material.dart';
import 'package:yomuy/components/atoms/novel_cell.dart';
import 'package:yomuy/types/novel_info.dart';

class NovelList extends StatefulWidget {
  const NovelList({Key? key, required this.novels}) : super(key: key);

  final List<NovelInfo> novels;

  @override
  State<NovelList> createState() => _NovelListState();
}

class _NovelListState extends State<NovelList> {
  @override
  Widget build(BuildContext context) {
    if (widget.novels.isEmpty) {
      return const Center(
        child: Text("保存済みの小説が存在しません。"),
      );
    } else {
      return FutureBuilder(
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: widget.novels.length,
            itemBuilder: (context, index) =>
                NovelCell(novelInfo: widget.novels[index]),
          );
        },
      );
    }
  }
}
