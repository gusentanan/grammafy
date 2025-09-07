import 'package:grammafy/domain/core/app_failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grammafy/domain/models/chat_answer_model.dart';
import 'package:grammafy/domain/models/tone_type.dart';

abstract class IGrammafyRepository {
  // Network
  Future<Either<AppFailure, ChatAnswerModel>> sendUserQuestion(String question, ToneType tone);
}
