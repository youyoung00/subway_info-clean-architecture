import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:subway/domain/use_case/get_infos_use_case.dart';

import '../../domain/use_case/data/info_data.dart';

class HomeViewModel with ChangeNotifier {
  final GetInfosUseCase getInfosUseCase;
  HomeViewModel(this.getInfosUseCase);

  List<InfoData> _subwayInfos = [];
  UnmodifiableListView<InfoData> get subwayInfos =>
      UnmodifiableListView(_subwayInfos);

  final _isLoading = false;
  get isLoading => _isLoading;

  Future<void> fetch(String query) async {
    final List<InfoData> result = await getInfosUseCase.call(query);
    _subwayInfos = result;
    notifyListeners();
  }
}
