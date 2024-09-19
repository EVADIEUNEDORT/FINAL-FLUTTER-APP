import 'package:flutter/material.dart';



class SwitchWithDetails extends StatefulWidget {
  final double height;
  final IconData icon;
  final String optionTitle;
  final String description;
  final bool initialValue; 

  const SwitchWithDetails({
    super.key,
    required this.height,
    required this.icon,
    required this.optionTitle,
    required this.description,
    this.initialValue = false,
  });

  @override
  State<SwitchWithDetails> createState() => _SwitchWithDetailsState();
}

class _SwitchWithDetailsState extends State<SwitchWithDetails> {
  bool _light = false; // 
  @override
  void initState() {
    super.initState();
    _light = widget.initialValue; 
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.height,
          child: Icon(widget.icon,
              color: const Color.fromARGB(
                  255, 5, 61, 107)), // Consistent icon color
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, 
            children: [
              Text(
                widget.optionTitle,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.description, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        Switch(
          value: _light,
          onChanged: (bool value) => setState(() => _light = value),
        ),
      ],
    );
  }
}

