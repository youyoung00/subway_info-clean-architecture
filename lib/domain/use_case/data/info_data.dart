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

  late String updnLine;
  late String trainLineNm;
  late String subwayHeading;
  late String statnNm;
  late String bstatnNm;
  late String recptnDt;
  late String arvlMsg2;
  late String arvlMsg3;
  late String arvlCd;
  late String barvlMin;

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
      barvlDt: barvlMin,
    );
  }
}
