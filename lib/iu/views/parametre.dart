import 'package:flutter/material.dart';
import 'package:second/constants/common/color/colors.dart';
import 'package:second/iu/ui.dart';
import 'package:second/iu/views/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isOpen = false;
  bool isSelectedFrench = false;
  bool isSelectedEnglish = false;
  bool light = false;

  void persisteState(
      {required bool isSelectedFrench, required bool isSelectedEnglish}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSelectedFrench', isSelectedFrench);
    await prefs.setBool('isSelectedEnglish', isSelectedEnglish);
  }

  void getfromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? french = prefs.getBool('isSelectedFrench');
    bool? english = prefs.getBool('isSelectedEnglish');
    if (french != null) {
      setState(() {
        isSelectedFrench = french;
      });
    }
    if (english != null) {
      setState(() {
        isSelectedEnglish = english;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getfromPreferences();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parametres"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: height,
              width: width,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitleWidget(
                    title: "Mon Profil",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const ProfileScreen();
                        },
                      ));
                    },
                    child: Optionwidget(
                      height: height,
                      icon: const Icon(Icons.person),
                      optionTitle: "Profile",
                      description: "description",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const SectionTitleWidget(
                    title: "Mes preferences",
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isOpen = true;
                      });
                    },
                    child: Optionwidget(
                      height: height,
                      icon: const Icon(Icons.language),
                      optionTitle: "langue",
                      description: "francais",
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Optionwidget(
                    height: height,
                    icon: const Icon(Icons.nightlight_round_outlined),
                    optionTitle: "theme",
                    description: "clair",
                    rightWidget: Switch(
                      activeColor: blue,
                      value: light,
                      onChanged: (value) {
                        setState(() {
                          light = !light;
                        });
                      },
                    ),
                  ),
                  Container()
                ],
              ),
            ),
          ),
          if (isOpen)
            GestureDetector(
              onTap: () {
                setState(() {
                  isOpen = false;
                });
              },
              child: Container(
                color: blue.withOpacity(0.8),
                alignment: Alignment.center,
              ),
            )
        ],
      ),
      bottomSheet: isOpen
          ? Sheetwidget(
              isSelectedEnglish: isSelectedEnglish,
              isSelectedFrench: isSelectedFrench,
              callBack: (french) {
                Future.delayed(
                  const Duration(milliseconds: 300),
                  () {
                    setState(() {
                      isOpen = false;
                      isSelectedFrench = french;
                      isSelectedEnglish = !french;
                    });
                    persisteState(
                        isSelectedFrench: isSelectedFrench,
                        isSelectedEnglish: isSelectedEnglish);
                  },
                );
              },
            )
          : const SizedBox(),
    );
  }
}
