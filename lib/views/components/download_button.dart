import 'package:downloadsfolder/downloadsfolder.dart' as download;
import 'package:xuprememax/utils/utils.dart';

class DownloadButton extends StatefulWidget {
  final String audioPath;
  const DownloadButton({
    super.key,
    required this.audioPath,
  });

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  void _download() async {
    final l10n = context.l10n;
    await download.copyFileIntoDownloadFolder(
      widget.audioPath,
      'fileName',
      desiredExtension: 'mp3',
    );
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.downloadedInfoText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _download,
      icon: Icon(Icons.download),
    );
  }
}
