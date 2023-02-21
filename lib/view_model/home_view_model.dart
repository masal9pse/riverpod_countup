import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/importer.dart';

class HomeViewModel extends StateNotifier<HomeUiState> {
  final HomeRepository _homeRepository;

  HomeViewModel({
    required HomeRepository homeRepository,
  })  : _homeRepository = homeRepository,
        super(const HomeUiState.init());

  Future<void> findData() async {
    state = const HomeUiState.loading();

    final result = await _homeRepository.fetchData();
    result.when(
      success: (User data) {
        state = HomeUiState.success(data.name);
      },
      failure: (AppError error) {
        state = HomeUiState.failure(error);
      },
    );
  }

  Future<void> initializeState() async {
    state = const HomeUiState.init();
  }
}