import 'package:flutter/material.dart';

class LanguageSelectionMenu extends StatefulWidget {
  const LanguageSelectionMenu({Key? key}) : super(key: key);

  @override
  _LanguageSelectionMenuState createState() => _LanguageSelectionMenuState();
}

class _LanguageSelectionMenuState extends State<LanguageSelectionMenu> {
  String selectedLanguage = 'Français';

  void _selectLanguage(String language) {
    setState(() {
      selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Container(
        height: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Choisir une langue',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () => _selectLanguage('Français'),
                  icon: const Icon(Icons.flag, color: Colors.blue),
                ),
                const Text('Français'),
                const Spacer(),
                Radio(
                  value: 'Français',
                  groupValue: selectedLanguage,
                  onChanged: (value) => _selectLanguage(value!),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () => _selectLanguage('Anglais'),
                  icon: const Icon(Icons.flag, color: Colors.red),
                ),
                const Text('Anglais'),
                const Spacer(),
                Radio(
                  value: 'Anglais',
                  groupValue: selectedLanguage,
                  onChanged: (value) => _selectLanguage(value!),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
