import '../../domain/model/info.dart';
import '../../domain/repository/info_api_repository.dart';
import '../dara_source/subway_api.dart';

class InfoApiRepositoryImpl implements InfoApiRepository {
  SubwayApi api;

  InfoApiRepositoryImpl(this.api);

  @override
  Future<List<Info>> fetch(String query) async {
    final Iterable result = await api.fetch(query);

    return result.map((e) => Info.fromJson(e)).toList();
  }
}
