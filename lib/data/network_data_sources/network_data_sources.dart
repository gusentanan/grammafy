import 'package:dio/dio.dart';
import 'package:grammafy/data/network_data_sources/dto/answer/chat_response_model.dart';
import 'package:grammafy/data/network_data_sources/dto/question/chat_model.dart';
import 'package:grammafy/utils/constant.dart';
import 'package:injectable/injectable.dart';

@injectable
class NetworkDataSource {
  final Dio _dio;

  NetworkDataSource(@Named('defaultDio') this._dio);

  Future<ChatResponseModel> sendQuestion(String question) async {
    final chatModel = ChatModel(
      systemInstruction: const InstructionModel(
        parts: PartModel(text: MODEL_INSTRUCTION),
      ),
      contents: [
        ContentModel(
          parts: [
            PartModel(text: question),
          ],
        ),
      ],
    );

    final response = await _dio.post(
      '/v1beta/models/gemini-1.5-flash:generateContent',
      data: chatModel.toJson(),
    );

    final chatResponse = ChatResponseModel.fromJson(response.data);

    return chatResponse;
  }
}
