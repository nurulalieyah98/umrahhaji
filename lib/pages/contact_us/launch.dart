import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrl {
  // static Future openLink ({
  //   @required String url,
  // }) => _launchUrl(url);

  static Future openEmail({
    @required String toEmail,
    @required String subject,
    @required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';

    await _launchUrl(url);
  }

  static Future launchUniversalLinkIos({String url}) async {
    if (await _launchUrl(url) != null) {
      if (await _launchUrl(url)) {
        final bool nativeAppLaunchSucceeded =
            await launch(url, forceSafariVC: false, universalLinksOnly: true);
        if (!nativeAppLaunchSucceeded) {
          await launch(url, forceSafariVC: true, universalLinksOnly: true);
        }
      }
    }
  }

  static Future launchWhatsapp({
    @required String phone,
    @required String message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
      }
    }

    if (await _launchUrl(url()) != null) {
      if (await _launchUrl(url())) {
        await launch(url());
      } else {
        throw 'Could not launch ${url()}';
      }
    }
  }

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
