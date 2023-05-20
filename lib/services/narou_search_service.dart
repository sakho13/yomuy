import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yomuy/types/novel_info.dart';

class NarouSearchService {
  static const int _pageSize = 20;

  int allCount = 0;
  bool _searched = false;

  bool isR18 = false;
  TextEditingController word = TextEditingController();
  TextEditingController ignore = TextEditingController();

  List<NovelInfo> result = [];

  /// 小説検索ロジック
  /// 検索結果の差分を返す
  Future<List<NovelInfo>> search() async {
    debugPrint(fetchUrl.toString());
    final res = await http.get(
      fetchUrl,
      headers: Map.from({"Content-Type": "application/json"}),
    );

    if (res.statusCode == 200) {
      _searched = true;
      final raw = jsonDecode(res.body) as List;
      final cnt = raw.first as Map;
      allCount = cnt["allcount"] as int;

      final List<NovelInfo> body = [];
      for (var i = 1; i < raw.length; i++) {
        body.add(NovelInfo.fromJson(raw[i]));
      }
      result.addAll(body);
      return body;
    } else {
      return [];
    }
  }

  _reset() {
    word.clear();
    ignore.clear();
    allCount = 0;
  }

  String _parseQueryParam(Map<String, String> params) {
    params["out"] = "json";
    params["lim"] = "$_pageSize";
    params["st"] = "${result.length + 1}";
    return "?${params.entries.map((e) => "${e.key}=${e.value}").join("&")}";
  }

  bool get _hasNext {
    return allCount > result.length;
  }

  /// すでに１回検索済み＆次がある
  bool get refetchable {
    return _hasNext && _searched;
  }

  String get _encodeWord {
    return Uri.encodeFull(word.text);
  }

  Uri get fetchUrl {
    final Map<String, String> params = {};

    if (word.text.isNotEmpty) {
      params["word"] = word.text.trim();
    }

    final param = _parseQueryParam(params);
    var rawUrl = "https://api.syosetu.com/novelapi/api/$param";
    return Uri.parse(rawUrl);
  }
}
