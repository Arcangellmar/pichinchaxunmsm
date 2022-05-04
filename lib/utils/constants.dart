import 'package:flutter/material.dart';
import 'package:pichinchaxunmsm/generated/l10n.dart';

const double kDefaultSize = 20.0;
const double kDefaultText = 16.0;
const double kMinWidthOfLargeScreen = 1000;

const String appTitle = "PICHINCHA X UNMSM";

extension StringExtension on String {
  String capitalize() => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

Future<bool> showExitPopup(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(S.of(context).exitApp.capitalize()),
      content: Text(S.of(context).wantExitApp.capitalize()),
      actions:[
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child:Text(S.of(context).no.capitalize()),
        ),
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(true),
          child:Text(S.of(context).yes.capitalize()),
        ),
      ],
    ),
  ) ?? false;
}