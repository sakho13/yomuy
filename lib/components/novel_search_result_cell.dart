import 'package:flutter/material.dart';
import 'package:yomuy/types/novel_info.dart';

class NovelSearchResultCell extends StatefulWidget {
  const NovelSearchResultCell({Key? key, required this.novelInfo})
      : super(key: key);

  final NovelInfo novelInfo;

  @override
  State<NovelSearchResultCell> createState() => _NovelSearchResultCellState();
}

class _NovelSearchResultCellState extends State<NovelSearchResultCell> {
  void _openNovelDetailModal() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text(widget.novelInfo.title),
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                Text(widget.novelInfo.story),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: GestureDetector(
        child: Card(
          margin: const EdgeInsets.fromLTRB(10, 4, 10, 8),
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Column(children: [
              Text(
                widget.novelInfo.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("")
            ]),
          ),
        ),
        onTap: () {
          _openNovelDetailModal();
        },
      ),
    );
  }
}
