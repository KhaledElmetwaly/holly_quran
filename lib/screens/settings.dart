import 'package:flutter/material.dart';

import '../core/constants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon:
                Icon(Icons.arrow_back, color: Color.fromARGB(255, 56, 115, 59)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: const Color.fromARGB(255, 253, 247, 230),
          title: Text(
            "Setting",
            style: TextStyle(color: Color.fromARGB(255, 56, 115, 59)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 253, 247, 230),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Arabic font size :",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Slider(
                      activeColor: Color.fromARGB(255, 56, 115, 59),
                      inactiveColor: Colors.green,
                      value: arabicFontSize,
                      min: 20,
                      max: 40,
                      onChanged: (value) {
                        setState(() {
                          arabicFontSize = value;
                        });
                      }),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: arabicFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Divider(),
                  ),
                  Text(
                    "Mushaf Font Size : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Slider(
                      activeColor: Color.fromARGB(255, 56, 115, 59),
                      inactiveColor: Colors.green,
                      value: moshafFontSize,
                      min: 20,
                      max: 50,
                      onChanged: (value) {
                        setState(() {
                          moshafFontSize = value;
                        });
                      }),
                  Text(
                    "‏ ‏‏ ‏‏‏‏ ‏‏‏‏‏‏ ‏",
                    style: TextStyle(
                        fontFamily: 'quran', fontSize: moshafFontSize),
                    textDirection: TextDirection.rtl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 56, 115, 59),
                        ),
                        onPressed: () {
                          setState(() {
                            arabicFontSize = 28;
                            moshafFontSize = 40;
                          });
                          saveSetting();
                        },
                        child: Text("Reset"),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 56, 115, 59),
                        ),
                        onPressed: () {
                          saveSetting();
                          Navigator.of(context).pop();
                        },
                        child: Text("Save"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
