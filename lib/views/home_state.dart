import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:github_flutter/model/github_repo.dart';
import 'package:github_flutter/service/github_service.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<GithubRepo> githubRepos,
  }) = _HomeState;
}

class HomeStateNotifier extends StateNotifier<HomeState> {
  HomeStateNotifier() : super(const HomeState());

  void fetchGithubRepos(String query) async {
    List<GithubRepo> result = await GithubService.fetchGithubRepos(query);
    state = state.copyWith(githubRepos: result);
  }
}
