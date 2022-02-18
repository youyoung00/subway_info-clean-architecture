import 'package:subway/domain/use_case/data/info_data.dart';

import '../repository/info_api_repository.dart';

class GetInfosUseCase {
  final InfoApiRepository repository;

  GetInfosUseCase(this.repository);

  Future<List<InfoData>> call(String query) async {
    final result = await repository.fetch(query);

    final infoDataList = result.map((e) => InfoData.fromInfo(e)).toList();

    return infoDataList;
  }
}
