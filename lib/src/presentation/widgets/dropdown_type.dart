import 'package:flutter/material.dart';

class DropdownType extends StatefulWidget {
  const DropdownType({super.key, required this.list});
  final List<String> list;

  @override
  State<DropdownType> createState() => _DropdownTypeState();
}

class _DropdownTypeState extends State<DropdownType> {
  String dropdownValue = '';
  @override
  void initState() {
    dropdownValue = widget.list[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.black,
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
        dropdownColor: Colors.black,
        iconSize: 40,
        autofocus: false,
        underline: const SizedBox(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onChanged: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }
}
