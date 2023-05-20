import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yomuy/types/novel_info.dart';

class NovelCell extends StatelessWidget {
  const NovelCell({Key? key, required this.novelInfo}) : super(key: key);

  final NovelInfo novelInfo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(novelInfo.title),
      trailing: const Icon(Icons.arrow_right),
      onTap: () {
        context.push("/novels/${novelInfo.ncode}");
      },
    );
  }
}
