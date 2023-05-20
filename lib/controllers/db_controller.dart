import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBController {
  final String _dbFileName = "yomuy_db.sqlite";

  late Database database;

  static Future<DBController> create() async {
    final controller = DBController();
    await controller._init();
    return controller;
  }

  Future<void> _init() async {
    final filePath = await _getDBPath();
    database = await openDatabase(
      filePath,
      onCreate: (newDB, version) {
        newDB.execute(_generateCreate(
          "novel",
          {
            "ncode": "TEXT",
            "title": "TEXT",
            "story": "TEXT",
            "userid": "INTEGER",
            "writer": "TEXT",
            "biggenre": "INTEGER",
            "genre": "INTEGER",
            "gensaku": "TEXT",
            "keyword": "TEXT",
            "general_firstup": "TEXT",
            "general_lastup": "TEXT",
            "novel_type": "INTEGER",
            "end": "INTEGER",
            "general_all_no": "INTEGER",
            "length": "INTEGER",
            "time": "INTEGER",
            "isstop": "INTEGER",
            "isr15": "INTEGER",
            "isbl": "INTEGER",
            "isgl": "INTEGER",
            "iszankoku": "INTEGER",
            "istensei": "INTEGER",
            "istenni": "INTEGER",
            "pc_or_k": "INTEGER",
            "global_point": "INTEGER",
            "daily_point": "INTEGER",
            "weekly_point": "INTEGER",
            "monthly_point": "INTEGER",
            "quarter_point": "INTEGER",
            "yearly_point": "INTEGER",
            "fav_novel_cnt": "INTEGER",
            "impression_cnt": "INTEGER",
            "review_cnt": "INTEGER",
            "all_point": "INTEGER",
            "all_hyoka_cnt": "INTEGER",
            "sasie_cnt": "INTEGER",
            "kaiwaritu": "INTEGER",
            "novelupdated_at": "TEXT",
            "updated_at": "TEXT",
          },
          ["ncode"],
          [],
        ));

        newDB.execute(_generateCreate(
          "novel_fetch_log",
          {
            "ncode": "TEXT",
            "last_checked_at": "TEXT",
          },
          ["ncode"],
          [],
        ));

        newDB.execute(_generateCreate(
          "chapter",
          {
            "ncode": "TEXT",
            "leading_episode_no": "INTEGER",
            "title": "TEXT",
          },
          ["ncode", "leading_episode_no"],
          [],
        ));

        newDB.execute(_generateCreate(
          "episode",
          {
            "ncode": "TEXT",
            "episodeNo": "INTEGER",
            "title": "TEXT",
            "posted_at": "TEXT",
            "refacted_at": "TEXT"
          },
          ["ncode", "episodeNo"],
          ["refacted_at"],
        ));
      },
    );
  }

  Future<String> _getDBPath() async {
    final path = (await getApplicationDocumentsDirectory()).path;
    return "$path/$_dbFileName";
  }

  String _generateCreate(
    String tableName,
    Map<String, String> columns,
    List<String> pks,
    List<String> nullables,
  ) {
    final keys = columns.entries.map((e) {
      var field = "${e.key} ${e.value}";
      if (pks.contains(e.key)) {
        field += " PRIMARY KEY";
      }
      if (nullables.contains(e.key)) {
        field += " NULL";
      } else {
        field += " NOT NULL";
      }
      return field;
    }).toList();
    final sql = "CREATE TABLE $tableName (${keys.join(",")})";
    return sql;
  }
}
