import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:subway/data/dara_source/subway_api.dart';

import '../data/repository/info_api_repository_Impl.dart';
import '../domain/repository/info_api_repository.dart';
import '../domain/use_case/get_infos_use_case.dart';
import '../presentation/home/home_view_model.dart';

// 1. Provider 전체
List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

// 2. 독립적인 객체. 다른 클래스에 의존하지 않는 Model.
List<SingleChildWidget> independentModels = [
  Provider<http.Client>(
    create: (context) => http.Client(),
  )
];

// 3. 2번 객체에 의존성 있는 객체. 2에 등록한 클래스에 의존하는 Model.
List<SingleChildWidget> dependentModels = [
  ProxyProvider<http.Client, SubwayApi>(
    update: (context, client, _) => SubwayApi(client),
  ),
  ProxyProvider<SubwayApi, InfoApiRepository>(
    update: (context, api, _) => InfoApiRepositoryImpl(api),
  ),
  ProxyProvider<InfoApiRepository, GetInfosUseCase>(
    update: (context, repository, _) => GetInfosUseCase(repository),
  ),
];

// 4. ViewModels
// View 가 사용. 2, 3에 등록한 클래스를 사용할 수 있음.
List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<HomeViewModel>(
    create: (context) => HomeViewModel(context.read<GetInfosUseCase>()),
  ),
];
