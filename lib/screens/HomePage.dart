import 'dart:math';

import 'package:cubit_api_request_test/cubit/post_fetch_cubit.dart';
import 'package:cubit_api_request_test/cubit/post_fetch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/posts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request test app'),
      ),
      body: BlocBuilder<PostFetchCubit, PostFetchState>(
        builder: (context, state) {
          if(state is PostFetchLoading){
            return Center(child: const CircularProgressIndicator());
          }
          else if (state is PostFetchError){
            return Center(child: Text(state.failure.message));
          }
          else if(state is PostFetchLoaded){
            final postList = state.postList;
            return postList.isEmpty ? const Text('No any posts'):
            ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index){
                  final Posts singlePost = postList[index];
                  return ListTile(
                    title: Text('Item: ${singlePost.title})'),
                  );
                },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
