import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yomuy/controllers/db_controller.dart';
import 'package:yomuy/types/episode_info.dart';
import 'package:yomuy/types/novel_info.dart';

class NarouService {
  String _ncode = "";
  late DBController _dbController;

  Future<void> init(String ncode) async {
    _ncode = ncode;
    _dbController = await DBController.create();
  }

  List<EpisodeInfo> fetchEpisodes() {
    return [];
  }
}
