import 'package:flutter/material.dart';

class YumeDialog extends StatelessWidget {
  const YumeDialog({
    super.key,
    this.title,
    this.content,
    this.dismissLabel,
    this.onDismiss,
    this.confirmLabel,
    this.onConfirm,
  });

  final String? title;
  final String? content;
  final String? dismissLabel;
  final void Function()? onDismiss;
  final String? confirmLabel;
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: content != null ? Text(content!) : null,
      actions: [
        if (dismissLabel != null)
          TextButton(
            onPressed: onDismiss,
            child: Text(dismissLabel!),
          ),
        if (confirmLabel != null)
          TextButton(
            onPressed: onConfirm,
            child: Text(confirmLabel!),
          ),
      ],
    );
  }
}
