import 'package:subway/domain/model/Info.dart';

class InfoData {
  InfoData({
    required this.updnLine,
    required this.trainLineNm,
    required this.subwayHeading,
    required this.statnNm,
    required this.bstatnNm,
    required this.recptnDt,
    required this.arvlMsg2,
    required this.arvlMsg3,
    required this.arvlCd,
    required this.barvlMin,
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
  late final String barvlMin;

  // 분으로 이름 변경.

  // InfoData();

  factory InfoData.fromInfo(Info info) {
    return InfoData(
      trainLineNm: info.trainLineNm,
      recptnDt: info.recptnDt,
      statnNm: info.statnNm,
      bstatnNm: info.bstatnNm,
      arvlCd: info.arvlCd,
      arvlMsg3: info.arvlMsg3,
      updnLine: info.updnLine,
      barvlMin: info.barvlDt,
      arvlMsg2: info.arvlMsg2,
      subwayHeading: info.subwayHeading,
    );
  }

  Info toInfo() {
    return Info(
        updnLine: updnLine,
        trainLineNm: trainLineNm,
        subwayHeading: subwayHeading,
        statnNm: statnNm,
        bstatnNm: bstatnNm,
        recptnDt: recptnDt,
        arvlMsg2: arvlMsg2,
        arvlMsg3: arvlMsg3,
        arvlCd: arvlCd,
        barvlDt: barvlMin);
  }
}
