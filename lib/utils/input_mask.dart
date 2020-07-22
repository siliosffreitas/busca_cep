import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

enum InputType {
  CEP,
}

extension InputMask on InputType {
  getKeyboardType() {
    switch (this) {
      case InputType.CEP:
        return TextInputType.number;

      default:
    }
  }

  getHint() {
    switch (this) {
      case InputType.CEP:
        return "00000-000";

      default:
    }
  }

  getMask() {
    switch (this) {
      case InputType.CEP:
        return MaskTextInputFormatter(
            mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});

      default:
    }
  }

  String getPrefixString() {
    switch (this) {
      case InputType.CEP:
        return null;

      default:
        return null;
    }
  }

  getPrefixIcon() {
    switch (this) {
      case InputType.CEP:
        return MaskTextInputFormatter(
            mask: "#####-###", filter: {"#": RegExp(r'[0-9]')});

      default:
    }
  }
}
