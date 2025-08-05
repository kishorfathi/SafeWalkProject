import 'package:url_launcher/url_launcher.dart';
import 'location_service.dart';

class SOSService {
  static Future<void> sendSOS() async {
    final location = await LocationService.getCurrentLocation();
    final message = 'Help me! My location: https://maps.google.com/?q=\${location.latitude},\${location.longitude}';
    final Uri smsUri = Uri.parse('sms:1234567890?body=\${Uri.encodeComponent(message)}');
    if (await canLaunchUrl(smsUri)) {
      await launchUrl(smsUri);
    } else {
      throw 'Could not launch SMS';
    }
  }
}