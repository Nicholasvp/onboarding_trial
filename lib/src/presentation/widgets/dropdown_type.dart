import 'package:flutter/material.dart';

class DropdownType extends StatefulWidget {
  const DropdownType(
      {super.key,
      required this.list,
      required this.onChanged,
      required this.color});
  final List<String> list;
  final Function(String) onChanged;
  final Color color;

  @override
  State<DropdownType> createState() => _DropdownTypeState();
}

class _DropdownTypeState extends State<DropdownType> {
  String dropdownValue = '';
  Function? onChanged;
  @override
  void initState() {
    dropdownValue = widget.list[0];
    onChanged = widget.onChanged;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: widget.color,
      child: DropdownButton<String>(
        items: widget.list.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }).toList(),
        value: dropdownValue,
        dropdownColor: widget.color,
        iconSize: 40,
        autofocus: false,
        underline: const SizedBox(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
            onChanged!(value);
          });
        },
      ),
    );
  }
}
