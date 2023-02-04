import 'package:bloc/bloc.dart';
import 'package:cubit_api_request_test/models/failure_model.dart';
import 'package:cubit_api_request_test/models/posts.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../repository/api_repostiory.dart';

part 'post_fetch_state.dart';

class PostFetchCubit extends Cubit<PostFetchState> {
  final ApiRepository apiRepository;

  PostFetchCubit({required this.apiRepository}) : super(PostFetchInitial());

  Future<void> fetchPostApi() async {
    emit(PostFetchLoading());
    try {
      final List<Posts>? postList = await apiRepository.getPostList();
      emit(PostFetchLoaded(postList: postList ?? []));
    } on Failure catch (err) {
      emit(PostFetchError(failure: err));
    } catch (err) {
      print("Error :$err");
    }
  }
}