import 'package:flutter/material.dart';

// Are you sure you want to delete this item?
// Yes, No
void showMessage(BuildContext context, String message, {
  String? posActionName, VoidCallback? posAction,
  String? negActionName, VoidCallback? negAction,
  bool isCancelable = true,
}) {
  List<Widget> actions = [];

  if (posActionName != null) {
    actions.add(TextButton(
      onPressed: () {
        Navigator.pop(context); // Called when user selects positive button
        if (posAction != null) posAction();
      },
      child: Text(posActionName),
    ));
  }

  if (negActionName != null) {
    actions.add(TextButton(
      onPressed: () {
        Navigator.pop(context); // Called when user selects negative button
        if (negAction != null) negAction();
      },
      child: Text(negActionName),
    ));
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: actions,
      );
    },
    barrierDismissible: isCancelable,
  );
}

void showLoading(BuildContext context, String loadingMessage, {
  bool isCancelable = true,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Row(
          children: [
            CircularProgressIndicator(),
            SizedBox(width: 12),
            Text(
              loadingMessage,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      );
    },
    barrierDismissible: isCancelable,
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
