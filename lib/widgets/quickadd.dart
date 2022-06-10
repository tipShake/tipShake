import 'package:flutter/material.dart';
import 'package:app/integers.dart';

class QuickAdd extends StatefulWidget {
  const QuickAdd({Key? key}) : super(key: key);

  @override
  State<QuickAdd> createState() => _QuickAddState();
}

class _QuickAddState extends State<QuickAdd> {
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: [
        //Add Money To Your Account

        ElevatedButton(
          onPressed: () {
            setState(() {});

            final snackBar = SnackBar(
              content: Text("Add \$ to your wallet"),
              action: SnackBarAction(
                label: 'Add',
                onPressed: () {
                  setState(() {});
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('+\$1'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              Numbers.moneyAdded == 1;
            });

            final snackBar = SnackBar(
              content: Text("Add \$ to your wallet"),
              action: SnackBarAction(
                label: 'Add',
                onPressed: () {
                  setState(() {});
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('+\$5'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});

            final snackBar = SnackBar(
              content: Text("Add \$ to your wallet"),
              action: SnackBarAction(
                label: 'Add',
                onPressed: () {
                  setState(() {});
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('+\$10'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {});

            final snackBar = SnackBar(
              content: Text("Add \$ to your wallet"),
              action: SnackBarAction(
                label: 'Add',
                onPressed: () {
                  setState(() {});
                },
              ),
            );

            // Find the ScaffoldMessenger in the widget tree
            // and use it to show a SnackBar.
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child: Text('+\$20'),
        ),
      ],
    );
  }
}
