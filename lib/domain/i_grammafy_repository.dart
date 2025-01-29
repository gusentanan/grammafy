import 'package:grammafy/domain/core/app_failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';

abstract class IGrammafyRepository {
  // Network
  Future<Either<AppFailure, ChatAnswerModel>> sendUserQuestion(String question);
}
