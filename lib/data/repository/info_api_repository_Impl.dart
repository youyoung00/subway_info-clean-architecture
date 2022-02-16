import '../../domain/model/Info.dart';
import '../../domain/repository/info_api_repository.dart';
import '../dara_source/subway_api.dart';

class InfoApiRepositoryImpl implements InfoApiRepository {
  SubwayApi api;

  InfoApiRepositoryImpl(this.api);

  @override
  Future<List<Info>> fetch(String query) async {
    final Iterable result = await api.fetch(query);

    return result.map((e) => Info.fromJson(e)).toList();
    // return result.when(
    //   success: (iterable) {
    //     return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
    //   },
    //   error: (message) {
    //     return Result.error(message);
    //   },
    // );
  }
}
