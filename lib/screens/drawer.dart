import 'package:flutter/material.dart';
import 'package:holly_quran/core/constants.dart';
import 'package:holly_quran/screens/settings.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Image.asset(
                  'assets/hollyquran.png',
                  height: 80,
                ),
                Text(
                  "القرآن الكريم",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: () {
              Share.share(
                "this Application is Developed by khaled Elmetwaly",
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.rate_review_rounded),
            title: Text("Rate"),
            onTap: () async {
              if (!await launchUrl(
                quranAppurl,
                mode: LaunchMode.externalApplication,
              )) {
                throw "Could not launch $quranAppurl";
              }
            },
          ),
        ],
      ),
    );
  }
}
