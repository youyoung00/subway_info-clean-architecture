import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:subway/domain/use_case/get_infos_use_case.dart';

import '../../domain/model/Info.dart';

class HomeViewModel with ChangeNotifier {
  final GetInfosUseCase getInfosUseCase;
  HomeViewModel(this.getInfosUseCase);

  List<Info> _subwayInfos = [];
  UnmodifiableListView<Info> get subwayInfos =>
      UnmodifiableListView(_subwayInfos);

  final _isLoading = false;
  get isLoading => _isLoading;

  Future<void> fetch(String query) async {
    final List<Info> result = await getInfosUseCase.call(query);
    _subwayInfos = result;
    notifyListeners();
  }
}
