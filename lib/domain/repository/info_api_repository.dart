import '../model/Info.dart';

abstract class InfoApiRepository {
  Future<List<Info>> fetch(String query);
}
