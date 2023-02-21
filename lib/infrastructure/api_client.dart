import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_countup/importer.dart';

class GithubApiClient {
  Future<Result<User, AppError>> getData() async {
    try {
      final url = Uri.parse("https://api.github.com/users/nowvilla-physi");
      final response = await http.get(url);
      final data = User.fromJson(json.decode(response.body));
      return Result.success(data);
    } on Exception catch (e) {
      return const Result.failure(AppError.fetchError());
    }
  }
}