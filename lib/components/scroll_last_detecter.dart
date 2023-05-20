import 'package:flutter/material.dart';

class ScrollLastDetecter extends StatefulWidget {
  const ScrollLastDetecter(
      {Key? key,
      required this.scrollController,
      required this.listViewKey,
      required this.action})
      : super(key: key);

  final ScrollController scrollController;
  final GlobalKey listViewKey;
  final void Function() action;

  @override
  State<ScrollLastDetecter> createState() => _ScrollLastDetecterState();
}

class _ScrollLastDetecterState extends State<ScrollLastDetecter> {
  Future<void> _onScroll() async {
    final renderBox = context.findRenderObject() as RenderBox?;
    final listViewRenderBox =
        widget.listViewKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderBox == null || listViewRenderBox == null) return;

    final listItemBottomPosition =
        renderBox.localToGlobal(Offset.zero).dy + renderBox.size.height - 15;

    final listViewBottomPosition =
        listViewRenderBox.localToGlobal(Offset.zero).dy +
            listViewRenderBox.size.height;

    // debugPrint(listItemBottomPosition.toString());
    if (listItemBottomPosition <= listViewBottomPosition) {
      debugPrint("aaa");
      widget.action();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => widget.scrollController.addListener(_onScroll),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.scrollController.removeListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
    );
  }
}
