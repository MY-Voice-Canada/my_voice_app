import 'package:flutter/material.dart';

double getadaptiveTextSize(BuildContext context, dynamic value) {
  return (value / 720) * MediaQuery.of(context).size.height;
}

String limit(int characterLimit, String text, {String overflow = '...'}) {
  final trimmedText = text.substring(0, characterLimit);
  if (trimmedText.endsWith('.')) return trimmedText;
  return trimmedText + overflow;
}
