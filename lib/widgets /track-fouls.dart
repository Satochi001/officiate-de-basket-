import 'package:flutter/material.dart';

class FoulTrackWidget extends StatefulWidget {
  const FoulTrackWidget({super.key});

  @override
  State<FoulTrackWidget> createState() => _FoulTrackingWidgetState();
}

class _FoulTrackingWidgetState extends State<FoulTrackWidget> {
  List<String>options = [
    "option 1",
    "option 2",
    "option 3",
    "option 4",
    "option 5",
  ];

  String?  _selectedOption;

  @override

  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
                  height:  43,
                  child:  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: options.length,
                    itemBuilder:
                        ( context,  index){
                      final option = options[index];
                      return SizedBox(
                        height: 30,
                        width: 30,
                        child:  RadioListTile(
                            value: option,
                            groupValue: _selectedOption,
                            onChanged: (String? value){
                              setState(() {
                                _selectedOption = value as String;
                                print("selected option: $_selectedOption");
                              });

                            }
                        ),
                      );

                        },

                  )
              ),




    );

  }
}