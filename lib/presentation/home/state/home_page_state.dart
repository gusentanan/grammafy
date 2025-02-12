part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  const factory HomePageState.initial() = _Initial;
  const factory HomePageState.loading() = _Loading;
  const factory HomePageState.success(ChatAnswerModel answer) = _Success;
  const factory HomePageState.failure(AppFailure failure) = _Failure;
}
