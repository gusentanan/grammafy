import 'package:fpdart/src/either.dart';
import 'package:grammafy/data/network_data_sources/network_data_sources.dart';
import 'package:grammafy/domain/core/app_failure.dart';
import 'package:grammafy/domain/i_grammafy_repository.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/utils/extensions.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IGrammafyRepository)
class GrammafyRepository implements IGrammafyRepository {
  final NetworkDataSource _networkDataSource;

  GrammafyRepository(this._networkDataSource);

  @override
  Future<Either<AppFailure, ChatAnswerModel>> sendUserQuestion(
      String question) async {
    try {
      final response = await _networkDataSource.sendQuestion(question);

      final chatAnswerModel = response.toChatAnswerModel();

      return right(chatAnswerModel);
    } catch (e) {
      return left(AppFailure.fromServerSide(e.toString()));
    }
  }
}
