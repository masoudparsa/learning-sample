library extension_package;

import 'package:flutter/material.dart';

extension OnPaddingColumn on Column {
  Widget padding(EdgeInsets edgeInsets) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }
}

extension OnPaddingRow on Row {
  Widget padding(EdgeInsets edgeInsets) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }
}
