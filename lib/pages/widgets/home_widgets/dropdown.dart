import 'package:flutter/material.dart';

class MyTextFieldWithDropdown extends StatefulWidget {
  @override
  _MyTextFieldWithDropdownState createState() =>
      _MyTextFieldWithDropdownState();
}

class _MyTextFieldWithDropdownState extends State<MyTextFieldWithDropdown> {
  String? dropdownValue;
  TextEditingController textEditingController = TextEditingController();
  bool showClearChip = false;
  double sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Card(
                child: DropdownButton<String>(
                  value: dropdownValue,
                  underline: Container(),
                  padding: EdgeInsets.all(5),
                  hint: Text('Select Category...'),
                  focusColor: Colors.white,
                  dropdownColor: Colors.white,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      textEditingController.text = newValue;
                      showClearChip = true;
                    });
                  },
                  items: <String>[
                    'Smartphones',
                    'Laptops',
                    'Fragrances',
                    'Skincare',
                    'Groceries',
                    'Home decoration'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ),
              SizedBox(width: 20),
              if (showClearChip)
                Positioned(
                  right: 0,
                  top: 0,
                  child: ActionChip(
                    label: Row(
                      children: [
                        Icon(Icons.clear),
                        SizedBox(width: 4.0),
                        Text('Clear'),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        dropdownValue = null;
                        textEditingController.text = '';
                        showClearChip = false;
                      });
                    },
                  ),
                ),
            ],
          ),
          if (dropdownValue != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('From'),
                    Text("\$ 1398"),
                  ],
                ),
                Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  label: "\$0",
                  onChanged: (newValue) {
                    setState(() {
                      sliderValue = newValue;
                    });
                  },
                ),
                Column(
                  children: [
                    Text('To'),
                    Text("\$ 2731"),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
