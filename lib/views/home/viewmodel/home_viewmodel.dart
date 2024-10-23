import 'dart:io';

import 'package:xuprememax/utils/utils.dart';

class HomeViewModel extends BaseViewModel {
  late final FutureSignal<String> postSignal;
  late final TextEditingController textEditingController;

  HomeViewModel() : super() {
    textEditingController = TextEditingController();
  }

  File? voiceFile;
  CancelToken _cancelToken = CancelToken();

  Future<void> makeRequest() async {
    value = AppLoadingState.loading;
    _cancelToken = CancelToken();
    voiceFile = null;
    await RequestHandler.handleRequest(
      request: () => SpeechRequest.instance.textToSpeech(
        message: textEditingController.text,
        cancelToken: _cancelToken,
      ),
      onSuccess: (data) async {
        voiceFile = await FileDownload.fromResponse(data);
        value = AppLoadingState.success;
      },
      onError: (error) {
        value = AppLoadingState.error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
          ),
        );
      },
      onComplete: () {
        value = AppLoadingState.normal;
      },
    );
  }

  Future<void> cancelRequest() async {
    voiceFile = null;
    _cancelToken.cancel('Cancelled');
  }

  @override
  void dispose() {
    textEditingController.dispose();
    postSignal.dispose();
    super.dispose();
  }
}
