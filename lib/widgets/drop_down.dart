import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  final List<String> list;
  final String? select;
  final String? hint;
  final Function(String) onChanged;

  const DropDownWidget({
    Key? key,
    required this.onChanged,
    required this.list,this.hint,
    required this.select,
  }) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? select;

  @override
  void initState() {
    super.initState();
    select = widget.select;
  }

  @override
  Widget build(BuildContext context) {
    return       DropdownButton<String>(
      isExpanded: true,
      hint:  Text(
       widget.hint?? 'Group',
      ),
      underline: const SizedBox(),
      value: select,
      // dropdownColor: Colors.grey,
      items: widget.list.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
      onChanged: (_) {
        FocusScope.of(context).requestFocus(FocusNode());
        FocusScope.of(context).requestFocus(FocusNode());

        setState(() {
          select = _!;
        });
        widget.onChanged(select!);
      },
    )
    ;
  }
}
