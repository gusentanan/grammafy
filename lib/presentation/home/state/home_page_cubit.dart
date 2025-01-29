import 'package:bloc/bloc.dart';
import 'package:grammafy/domain/i_grammafy_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/domain/core/app_failure.dart';
import 'package:injectable/injectable.dart';

part 'home_page_cubit.freezed.dart';
part 'home_page_state.dart';

@Injectable()
class HomePageCubit extends Cubit<HomePageState> {
  final IGrammafyRepository repository;

  HomePageCubit(this.repository) : super(const HomePageState.initial());

  Future<void> sendQuestion(String question) async {
    emit(const HomePageState.loading());
    final result = await repository.sendUserQuestion(question);
    result.fold(
      (failure) => emit(HomePageState.failure(failure)),
      (answer) => emit(HomePageState.success(answer)),
    );
  }
}
