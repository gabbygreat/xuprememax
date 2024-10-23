import 'package:xuprememax/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String path = '/home';
  static const String name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  void _generateSpeech() {
    _homeViewModel.makeRequest();
  }

  void _cancelRequest() {
    _homeViewModel.cancelRequest();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstant.appName,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _homeViewModel.textEditingController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  alignLabelWithHint: false,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _homeViewModel,
            builder: (context, value, _) {
              if (value == AppLoadingState.loading) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    20.horizontalSpace,
                    ElevatedButton(
                      onPressed: _cancelRequest,
                      child: Text(l10n.cancelButtonText),
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_homeViewModel.voiceFile != null) ...[
                      PlayButton(
                        audioPath: _homeViewModel.voiceFile!.path,
                      ),
                      DownloadButton(
                        audioPath: _homeViewModel.voiceFile!.path,
                      ),
                    ],
                    ValueListenableBuilder(
                      valueListenable: _homeViewModel.textEditingController,
                      builder: (context, textValue, _) {
                        return ElevatedButton(
                          onPressed:
                              textValue.text.isEmpty ? null : _generateSpeech,
                          child: Text(l10n.generateButtonText),
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
          20.verticalSpace,
        ],
      ),
    );
  }
}
