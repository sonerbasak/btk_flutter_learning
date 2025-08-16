import 'package:flutter/material.dart';

class CheckBoxSwitchRadioSlider extends StatefulWidget {
  const CheckBoxSwitchRadioSlider({super.key});

  @override
  State<CheckBoxSwitchRadioSlider> createState() =>
      _CheckBoxSwitchRadioSliderState();
}

class _CheckBoxSwitchRadioSliderState extends State<CheckBoxSwitchRadioSlider> {
  bool _isChecked = false;
  bool _isCheckedforRadio = true;
  String _secilenSehir = "Balıkesir";
  String _secilenSehir2 = "Ankara";
  double _slider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Text("Checkbox"),
              ],
            ),
            CheckboxListTile(
              secondary: Icon(Icons.topic),
              title: Text("Checkbox List Tile"),
              subtitle: Text("Subtitle"),
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
            Row(
              children: [
                Switch(
                  value: _isCheckedforRadio,
                  onChanged: (value) {
                    setState(() {
                      _isCheckedforRadio = value;
                    });
                  },
                ),
                Text("Bildirimleri Aç"),
              ],
            ),
            SwitchListTile(
              title: Text("Switch List Tile"),
              subtitle: Text("Bildirimleri Aç"),
              value: _isCheckedforRadio,
              onChanged: (value) {
                setState(() {
                  _isCheckedforRadio = value;
                });
              },
            ),
            Row(
              children: [
                Radio<String>(
                  value: "Ankara",
                  groupValue: _secilenSehir,
                  onChanged: (value) {
                    setState(() {
                      _secilenSehir = value!;
                    });
                  },
                ),
                Text("Ankara"),
                Radio<String>(
                  value: "İzmir",
                  groupValue: _secilenSehir,
                  onChanged: (value) {
                    setState(() {
                      _secilenSehir = value!;
                    });
                  },
                ),
                Text("İzmir"),
                Radio<String>(
                  value: "İstanbul",
                  groupValue: _secilenSehir,
                  onChanged: (value) {
                    setState(() {
                      _secilenSehir = value!;
                    });
                  },
                ),
                Text("İstanbul"),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Ankara"),
                    value: "Ankara",
                    groupValue: _secilenSehir2,
                    onChanged: (value) {
                      setState(() {
                        _secilenSehir2 = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("İzmir"),
                    value: "İzmir",
                    groupValue: _secilenSehir2,
                    onChanged: (value) {
                      setState(() {
                        _secilenSehir2 = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("İstanbul"),
                    value: "İstanbul",
                    groupValue: _secilenSehir2,
                    onChanged: (value) {
                      setState(() {
                        _secilenSehir2 = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Slider(
              value: _slider,
              min: 0,
              max: 100,
              divisions: 100,
              label: _slider.round().toString(),
              onChanged: (value) {
                setState(() {
                  _slider = value;
                });
              },
            ),
            Text("Slider Değeri: ${_slider.toStringAsFixed(2)}"),
          ],
        ),
      ),
    );
  }
}
