import '../model/Info.dart';
import '../repository/info_api_repository.dart';

class GetInfosUseCase {
  final InfoApiRepository repository;

  GetInfosUseCase(this.repository);

  Future<List<Info>> call(String query) async {
    final result = await repository.fetch(query);

    // for (int i = 0; i == result.length; i++) {
    //   print('연산 전 : ${result[i].barvlDt}');
    //   double millisecond = double.parse(result[i].barvlDt) / 60;
    //   String stringMillisecond = millisecond.toInt().toString();
    //   result[i].barvlDt = stringMillisecond;
    //   print('연산 후 : ${result[i].barvlDt}');
    // }

    return result;
  }
}
