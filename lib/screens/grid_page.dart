// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  const GridPage({
    Key? key,
    required this.rows,
    required this.columns,
    required this.alphabets,
  }) : super(key: key);
  final int rows;
  final int columns;
  final String alphabets;

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  final TextEditingController wordController = TextEditingController();

  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  searchWord(String word) {
    print(word);
    searchHorizontally(word);
    searchVetically(word);
    searchDiagonally(word);
  }

  searchHorizontally(String word) {
    for (int i = 0; i < widget.rows; i++) {
      var s = "";
      for (int j = 0; j < widget.columns; j++) {
        s += widget.alphabets[widget.columns * i + j];
      }
      if (s.contains(word)) {
        print("found It Horizontal");
      }
    }
  }

  searchVetically(String word) {
    for (int i = 0; i < widget.columns; i++) {
      var s = "";
      for (int j = 0; j < widget.rows; j++) {
        s += widget.alphabets[widget.columns * j + i];
      }
      if (s.contains(word)) {
        print("found It Vertical");
      }
    }
  }

  searchDiagonally(String word) {
    for (int i = 0; i < widget.rows; i++) {
      var s1 = "";
      var s2 = "";
      for (int j = 0; j < (i + 1); j++) {
        s1 += widget.alphabets[i + j * widget.rows];
        s2 += widget
            .alphabets[widget.rows * widget.columns - 1 - i - j * widget.rows];
      }
      if (s1.contains(word) || s2.contains(word)) {
        print("found It Diagonal 1");
      }
    }
    for (int i = 0; i < widget.rows; i++) {
      var s1 = "";
      var s2 = "";
      for (int j = 0; j < (i + 1); j++) {
        s1 += widget.alphabets[widget.rows - i + (widget.columns + 1) * j];
        s2 += widget.alphabets[widget.rows * widget.columns -
            1 -
            (widget.rows - i + (widget.columns + 1) * j)];
      }
      if (s1.contains(word) || s2.contains(word)) {
        print("found It Diagonal 2");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            GridView.count(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisCount: widget.columns,
              children: [
                ...List.generate(
                  widget.rows * widget.columns,
                  (index) => Container(
                      key: ValueKey(index),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        widget.alphabets[index],
                        style: TextStyle(color: Colors.black),
                      )),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              controller: wordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Word',
              ),
            ),
            ElevatedButton(
                child: const Text("Search"),
                onPressed: () {
                  searchWord(wordController.text);
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
