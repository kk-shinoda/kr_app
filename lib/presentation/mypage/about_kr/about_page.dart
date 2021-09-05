import 'package:flutter/material.dart';
import 'package:kr_app/common/constants.dart';
import 'package:kr_app/common/secret_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('キエーロについて'),
      backgroundColor: Colors.orange.shade50,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: kBackgroundDecoration,
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: ListView(
            children: [
              urlList(kieroHPName, kieroHPURL),
              urlList(kieroOfficialName, kieroOfficialURL),
              urlList(kieroFBName, kieroFBURL),
              urlList(withKieroName, withKieroURL),
              urlList(kieroYouTubeName, kieroYouTubeURL),
            ],
          ),
        ),
      ),
    );
  }
}

Widget urlList(String name, String url) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
    child: Card(
        color: Colors.grey.shade100,
        child: ListTile(
            trailing: Icon(Icons.keyboard_arrow_right_outlined),
            title: Text(name),
            onTap: () => _launchURL(url))),
  );
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('cant');
    throw 'Could not launch $url';
  }
}
