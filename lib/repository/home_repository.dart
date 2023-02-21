import 'package:flutter/material.dart';
import 'package:riverpod_countup/importer.dart';

abstract class HomeRepository {
  Future<Result<User, AppError>> fetchData();
}

class HomeRepositoryImpl implements HomeRepository {
  final GithubApiClient apiClient;

  HomeRepositoryImpl(this.apiClient);
  @override
  Future<Result<User, AppError>> fetchData() async {
      return await apiClient.getData();
  }
}
