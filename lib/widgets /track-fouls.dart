import 'package:flutter/material.dart';

class FoulTrackWidget extends StatefulWidget {
  const FoulTrackWidget({super.key});

  @override
  State<FoulTrackWidget> createState() => _FoulTrackingWidgetState();
}

class _FoulTrackingWidgetState extends State<FoulTrackWidget> {

  
  // firstly you get the list

  List<bool> selected = List.generate(5,(index) =>  false );
  int lastClickedIndex = -1;

  void toggleSelection(int index) {
    setState(() {
      selected[index] = !selected[index];
      lastClickedIndex = index;  // Mark this button as clicked
// Toggle the selected state
    });
  }


  @override

  Widget build(BuildContext context) {
    return SafeArea(
          child : SizedBox(
            height:  53,
            child :ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: selected.length ,
                itemBuilder: (context, index  ) {
                  return IconButton(
                    icon: Icon(
                      selected[index] ? Icons.radio_button_checked :
                      Icons.radio_button_unchecked,
                      color: selected[index] ? Colors.blue : Colors.grey,

                    ),
                    onPressed: (index == lastClickedIndex || index == lastClickedIndex + 1)
                        ? () {
                      toggleSelection(index);
                      // If the last clicked button is unchecked, move lastClickedIndex backward
                      if (!selected[index]) {
                        lastClickedIndex = index - 1;
                      }
                    }
                        : null,

                  );
                }
            ),
          ),




    );

  }
}