import 'package:flutter/material.dart';
import 'package:yomuy/services/narou_search_service.dart';

class NovelSearchForm extends StatefulWidget {
  const NovelSearchForm(
      {Key? key, required this.narouSearchService, required this.runAction})
      : super(key: key);

  final NarouSearchService narouSearchService;
  final Future<void> Function() runAction;

  @override
  State<NovelSearchForm> createState() => _NovelSearchFormState();
}

class _NovelSearchFormState extends State<NovelSearchForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _search() async {
    await widget.runAction();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text("検索"),
      children: [
        Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                // 通常 or R18
                isR18FormSwitch(context),
                // 検索ワード
                wordFormInput(context),
                // 除外ワード
                ignoreWordFormInput(context),
                // 大ジャンル
                // ボタン
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("閉じる"),
                    ),
                    TextButton(
                      onPressed: _search,
                      child: const Text("検索"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget isR18FormSwitch(BuildContext context) {
    return Row(
      children: [
        Switch(
            value: widget.narouSearchService.isR18,
            activeColor: Colors.pink.shade400,
            onChanged: (value) {
              setState(() {
                widget.narouSearchService.isR18 = value;
              });
            }),
        const Text("R18"),
      ],
    );
  }

  Widget wordFormInput(BuildContext context) {
    return TextFormField(
      controller: widget.narouSearchService.word,
      decoration: const InputDecoration(
        labelText: "検索ワード",
      ),
    );
  }

  Widget ignoreWordFormInput(BuildContext context) {
    return TextFormField(
      controller: widget.narouSearchService.ignore,
      decoration: const InputDecoration(
        labelText: "除外ワード",
      ),
    );
  }
}
