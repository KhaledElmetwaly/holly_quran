import 'package:flutter/material.dart';
import 'package:holly_quran/core/arabic_surah_number.dart';
import 'package:holly_quran/core/constants.dart';
import 'package:holly_quran/screens/drawer.dart';
import 'package:holly_quran/screens/surah_builder.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الْقُرْآنَ الكريم",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, shadows: [
            Shadow(
              offset: Offset(1, 1),
              blurRadius: 2,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ]),
        ),
        backgroundColor: Color.fromARGB(255, 56, 115, 59),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        tooltip: "Go to bookmark",
        child: Icon(Icons.bookmark),
        backgroundColor: Colors.green,
        onPressed: () async {
          fabIsClicked = true;
          if (await readBookMark() == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SurahBuilder(
                  ayah: bookMarkedAyah,
                  arabic: quran[0],
                  surah: bookMarkedSurah - 1,
                  surahName: arabicName[bookMarkedSurah - 1]['name'],
                ),
              ),
            );
          }
        },
      ),
      body: FutureBuilder(
        future: readJson(),
        builder: (
          BuildContext context,
          AsyncSnapshot snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              return indexCreator(snapshot.data, context);
            } else {
              return const Text('Empty data');
            }
          } else {
            return Text('State: ${snapshot.connectionState}');
          }
        },
      ),
    );
  }
}

Container indexCreator(quran, context) {
  return Container(
    color: const Color.fromARGB(255, 221, 250, 236),
    child: ListView(
      children: [
        for (int i = 0; i < 114; i++)
          Container(
            color: i % 2 == 0
                ? const Color.fromARGB(255, 253, 247, 230)
                : const Color.fromARGB(255, 253, 251, 240),
            child: TextButton(
              child: Row(
                children: [
                  ArabicSurahNumber(i: i),
                  const SizedBox(
                    width: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    arabicName[i]['name'],
                    style: const TextStyle(
                        fontSize: 30,
                        color: Colors.black87,
                        fontFamily: 'quran',
                        shadows: [
                          Shadow(
                            offset: Offset(.5, .5),
                            blurRadius: 1.0,
                            color: Color.fromARGB(255, 130, 130, 130),
                          )
                        ]),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
              onPressed: () {
                fabIsClicked = false;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SurahBuilder(
                            arabic: quran[0],
                            surah: i,
                            surahName: arabicName[i]['name'],
                            ayah: 0,
                          )),
                );
              },
            ),
          ),
      ],
    ),
  );
}
