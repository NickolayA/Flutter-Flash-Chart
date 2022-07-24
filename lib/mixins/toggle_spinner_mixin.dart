import 'package:flutter/material.dart';

mixin ToggleSpinnerMixin<T extends StatefulWidget> on State<T> {
  bool showSpinner = false;

  void toggleSpinner() {
    setState(
      () {
        showSpinner = !showSpinner;
      },
    );
  }
}
