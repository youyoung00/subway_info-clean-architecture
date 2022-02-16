class Info {
  Info({
    required this.updnLine,
    required this.trainLineNm,
    required this.subwayHeading,
    required this.statnNm,
    required this.bstatnNm,
    required this.recptnDt,
    required this.arvlMsg2,
    required this.arvlMsg3,
    required this.arvlCd,
    required this.barvlDt,
  });

  late final String updnLine;
  late final String trainLineNm;
  late final String subwayHeading;
  late final String statnNm;
  late final String bstatnNm;
  late final String recptnDt;
  late final String arvlMsg2;
  late final String arvlMsg3;
  late final String arvlCd;
  late final String barvlDt;

  Info.fromJson(Map<String, dynamic> json) {
    updnLine = json['updnLine'] ?? '정보없음';
    trainLineNm = json['trainLineNm'] ?? '정보없음';
    subwayHeading = json['subwayHeading'] ?? '정보없음';
    statnNm = json['statnNm'] ?? '정보없음';
    bstatnNm = json['bstatnNm'] ?? '정보없음';
    recptnDt = json['recptnDt'] ?? '정보없음';
    arvlMsg2 = json['arvlMsg2'] ?? '정보없음';
    arvlMsg3 = json['arvlMsg3'] ?? '정보없음';
    arvlCd = json['arvlCd'] ?? '정보없음';
    barvlDt = json['barvlDt'] ?? '정보없음';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['updnLine'] = updnLine;
    _data['trainLineNm'] = trainLineNm;
    _data['subwayHeading'] = subwayHeading;
    _data['statnNm'] = statnNm;
    _data['bstatnNm'] = bstatnNm;
    _data['recptnDt'] = recptnDt;
    _data['arvlMsg2'] = arvlMsg2;
    _data['arvlMsg3'] = arvlMsg3;
    _data['arvlCd'] = arvlCd;
    _data['barvlDt'] = barvlDt;

    return _data;
  }

  @override
  String toString() {
    return 'Info{updnLine: $updnLine, trainLineNm: $trainLineNm, subwayHeading: $subwayHeading, statnNm: $statnNm, bstatnNm: $bstatnNm, recptnDt: $recptnDt, arvlMsg2: $arvlMsg2, arvlMsg3: $arvlMsg3, arvlCd: $arvlCd, barvlDt: $barvlDt}';
  }
}
