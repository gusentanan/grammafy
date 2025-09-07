import 'package:bloc/bloc.dart';
import 'package:grammafy/domain/i_grammafy_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/domain/core/app_failure.dart';
import 'package:grammafy/domain/models/tone_type.dart';
import 'package:injectable/injectable.dart';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

@Injectable()
class HomePageCubit extends Cubit<HomePageState> {
  final IGrammafyRepository repository;

  HomePageCubit(this.repository) : super(const HomePageState.initial());

  void selectTone(ToneType tone) {
    state.when(
      initial: (selectedTone) => emit(HomePageState.initial(selectedTone: tone)),
      loading: (selectedTone) => emit(HomePageState.loading(selectedTone: tone)),
      success: (answer, selectedTone) => emit(HomePageState.success(answer, selectedTone: tone)),
      failure: (failure, selectedTone) => emit(HomePageState.failure(failure, selectedTone: tone)),
    );
  }

  Future<void> sendQuestion(String question) async {
    final currentTone = state.when(
      initial: (selectedTone) => selectedTone,
      loading: (selectedTone) => selectedTone,
      success: (answer, selectedTone) => selectedTone,
      failure: (failure, selectedTone) => selectedTone,
    );

    emit(HomePageState.loading(selectedTone: currentTone));
    final result = await repository.sendUserQuestion(question, currentTone);
    result.fold(
      (failure) => emit(HomePageState.failure(failure, selectedTone: currentTone)),
      (answer) => emit(HomePageState.success(answer, selectedTone: currentTone)),
    );
  }
}
