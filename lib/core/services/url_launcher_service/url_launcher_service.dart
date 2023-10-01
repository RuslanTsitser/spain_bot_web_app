import 'package:url_launcher/url_launcher.dart';

abstract class UrlLauncherService {
  Future<void> openBlsPage(String url, String phpSessionId);
}

class UrlLauncherServiceImpl implements UrlLauncherService {
  @override
  Future<void> openBlsPage(String url, String phpSessionId) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      webViewConfiguration: WebViewConfiguration(headers: {
        "Cookie": "PHPSESSID=$phpSessionId",
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*',
      }),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
