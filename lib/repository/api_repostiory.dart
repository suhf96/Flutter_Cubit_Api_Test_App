import 'package:cubit_api_request_test/models/posts.dart';
import 'package:cubit_api_request_test/service/api_service.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiService apiService;

  Future<List<Posts>?> getPostList() async {
    final response = await apiService.getPostData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      return data
          .map(
            (singlePost) => Posts.fromMap(singlePost),
      )
          .toList();
    }
  }
}
