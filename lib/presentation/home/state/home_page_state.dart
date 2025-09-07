part of 'home_page_cubit.dart';

@freezed
class HomePageState with _$HomePageState {
  const HomePageState._();

  const factory HomePageState.initial({
    @Default(ToneType.neutral) ToneType selectedTone,
  }) = _Initial;
  const factory HomePageState.loading({
    @Default(ToneType.neutral) ToneType selectedTone,
  }) = _Loading;
  const factory HomePageState.success(
    ChatAnswerModel answer, {
    @Default(ToneType.neutral) ToneType selectedTone,
  }) = _Success;
  const factory HomePageState.failure(
    AppFailure failure, {
    @Default(ToneType.neutral) ToneType selectedTone,
  }) = _Failure;
}
