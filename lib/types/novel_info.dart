class NovelInfo {
  final String ncode;
  final String title;
  final String story;
  final int userid;
  final String writer;
  final int biggenre;
  final int genre;
  final String gensaku;
  final String keyword;
  final String generalFirstup;
  final String generalLastup;
  final int novelType;
  final int end;
  final int generalAllNo;
  final int length;
  final int time;
  final int isstop;
  final int isr15;
  final int isbl;
  final int isgl;
  final int iszankoku;
  final int istensei;
  final int istenni;
  final int pcOrK;
  final int globalPoint;
  final int dailyPoint;
  final int weeklyPoint;
  final int monthlyPoint;
  final int quarterPoint;
  final int yearlyPoint;
  final int favNovelCnt;
  final int impressionCnt;
  final int reviewCnt;
  final int allPoint;
  final int allHyokaCnt;
  final int sasieCnt;
  final int kaiwaritu;
  final String novelupdatedAt;
  final String updatedAt;

  NovelInfo(
    this.ncode,
    this.title,
    this.story,
    this.userid,
    this.writer,
    this.biggenre,
    this.genre,
    this.gensaku,
    this.keyword,
    this.generalFirstup,
    this.generalLastup,
    this.novelType,
    this.end,
    this.generalAllNo,
    this.length,
    this.time,
    this.isstop,
    this.isr15,
    this.isbl,
    this.isgl,
    this.iszankoku,
    this.istensei,
    this.istenni,
    this.pcOrK,
    this.globalPoint,
    this.dailyPoint,
    this.weeklyPoint,
    this.monthlyPoint,
    this.quarterPoint,
    this.yearlyPoint,
    this.favNovelCnt,
    this.impressionCnt,
    this.reviewCnt,
    this.allPoint,
    this.allHyokaCnt,
    this.sasieCnt,
    this.kaiwaritu,
    this.novelupdatedAt,
    this.updatedAt,
  );

  factory NovelInfo.fromJson(Map<String, dynamic> json) {
    return NovelInfo(
      json["ncode"],
      json["title"],
      json["story"],
      json["userid"],
      json["writer"],
      json["biggenre"],
      json["genre"],
      json["gensaku"],
      json["keyword"],
      json["general_firstup"],
      json["general_lastup"],
      json["novel_type"],
      json["end"],
      json["general_all_no"],
      json["length"],
      json["time"],
      json["isstop"],
      json["isr15"],
      json["isbl"],
      json["isgl"],
      json["iszankoku"],
      json["istensei"],
      json["istenni"],
      json["pc_or_k"],
      json["global_point"],
      json["daily_point"],
      json["weekly_point"],
      json["monthly_point"],
      json["quarter_point"],
      json["yearly_point"],
      json["fav_novel_cnt"],
      json["impression_cnt"],
      json["review_cnt"],
      json["all_point"],
      json["all_hyoka_cnt"],
      json["sasie_cnt"],
      json["kaiwaritu"],
      json["novelupdated_at"],
      json["updated_at"],
    );
  }
}

final novelInfoSample = NovelInfo(
  "sample",
  "これはサンプル",
  "",
  1,
  "",
  1,
  1,
  "",
  "",
  "generalFirstup",
  "generalLastup",
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  1,
  "novelupdatedAt",
  "updatedAt",
);
