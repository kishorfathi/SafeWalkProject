import 'package:speech_to_text/speech_to_text.dart';

class VoiceCommandService {
  final SpeechToText _speech = SpeechToText();

  Future<void> listenForSOS(Function onTrigger) async {
    bool available = await _speech.initialize();
    if (available) {
      _speech.listen(onResult: (result) {
        if (result.recognizedWords.toLowerCase().contains('help me')) {
          onTrigger();
          _speech.stop();
        }
      });
    }
  }

  void stopListening() {
    _speech.stop();
  }
}