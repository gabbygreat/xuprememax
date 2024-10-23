import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstant {
  static const String appName = 'Xupreme Max';
  static const String baseUrl = 'https://api.elevenlabs.io/';
  static String elevenLabsAPIKey = dotenv.env['ELEVENLABS_API_KEY']!;
  static String elevenLabsVoice = dotenv.env['ELEVENLABS_VOICE']!;
}
