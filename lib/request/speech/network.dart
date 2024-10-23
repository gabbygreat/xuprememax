import 'package:xuprememax/utils/utils.dart';

class SpeechRequest extends NetworkService {
  SpeechRequest._init();
  static SpeechRequest instance = SpeechRequest._init();

  Future<Uint8List> textToSpeech({
    required String message,
    required CancelToken cancelToken,
  }) async {
    final voiceId = AppConstant.elevenLabsVoice;
    final path = 'v1/text-to-speech/$voiceId/stream';

    final response = await postRequestHandler(
      path,
      cancelToken: cancelToken,
      options: Options(
          responseType: ResponseType.bytes,
          ),
      data: {
        'text': message,
        'model_id': 'eleven_multilingual_v2',
      },
    );
    return response.data!;
  }
}
