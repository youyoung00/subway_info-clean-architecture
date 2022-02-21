import '../model/info.dart';

abstract class InfoApiRepository {
  Future<List<Info>> fetch(String query);
}
