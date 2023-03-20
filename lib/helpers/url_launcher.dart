import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static void launchURL(
    url, {
    urlLaunchMode: LaunchMode.platformDefault,
  }) async {
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: urlLaunchMode);
    } else {
      try {
        await launchUrl(uri, mode: urlLaunchMode);
      } catch (err) {
        throw Exception('Could not launch $url. Error: $err');
      }
    }
  }
}
