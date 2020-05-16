library uiblock;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiblock/uiblock_modal.dart';

class UIBlock {
  /// blocks complete ui
  /// do not forget to call unblock after this
  static void block(
    BuildContext context, {
    ChildBuilder childBuilder,
    Widget customLoaderChild,
    Widget loadingTextWidget,
    Color backgroundColor,
    bool canDissmissOnBack,
    ImageFilter imageFilter,
  }) {
    Navigator.of(context).push(
      UIBlockModal(
        childBuilder: childBuilder,
        customLoaderChild: customLoaderChild,
        loadingTextWidget: loadingTextWidget,
        backgroundColor: backgroundColor,
        canDissmissOnBack: canDissmissOnBack,
        imageFilter: imageFilter,
      ),
    );
  }

  /// unblocks previously called block
  static void unblock(BuildContext context) {
    Navigator.of(context).pop(context);
  }
}
