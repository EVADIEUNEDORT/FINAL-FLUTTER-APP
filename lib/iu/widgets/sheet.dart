import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:second/constants/common/color/colors.dart';

class Sheetwidget extends StatefulWidget {
  final bool isSelectedFrench;
  final bool isSelectedEnglish;
  final Function(bool french) callBack;
  const Sheetwidget({
    super.key,
    required this.callBack,
    required this.isSelectedFrench,
    required this.isSelectedEnglish,
  });

  @override
  State<Sheetwidget> createState() => _SheetwidgetState();
}

class _SheetwidgetState extends State<Sheetwidget> {
  late bool isSelectedFrench;
  late bool isSelectedEnglish;

  @override
  void initState() {
    super.initState();
    isSelectedEnglish = widget.isSelectedEnglish;
    isSelectedFrench = widget.isSelectedFrench;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 200.0, // Set a reasonable default height
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                offset: const Offset(0, 2.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Choisir une langue',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(), // Add a divider for better separation
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/svg/france.svg',
                  height: 15,
                  width: 15,
                ), // Replace with your France flag image asset
                title: const Text('Français'),
                onTap: () {
                  setState(() {
                    isSelectedEnglish = false;
                    isSelectedFrench = true;
                  });
                  widget.callBack(true);
                },
                trailing: RadiooptionButton(isSelected: isSelectedFrench),
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/icons/svg/usa.svg',
                  height: 15,
                  width: 15,
                ), // Replace with your USA flag image asset
                title: const Text('Anglais'),
                onTap: () {
                  setState(() {
                    isSelectedFrench = false;
                    isSelectedEnglish = true;
                  });
                  widget.callBack(false);
                },
                trailing: RadiooptionButton(isSelected: isSelectedEnglish),
              ),
            ],
          )),
    );
  }
}

class RadiooptionButton extends StatelessWidget {
  const RadiooptionButton({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          color: white,
          border: Border.all(color: blue, width: 2),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: isSelected ? blue : white,
              borderRadius: BorderRadius.circular(100)),
          height: 8,
          width: 8,
        ),
      ),
    );
  }
}
