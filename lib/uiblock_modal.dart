import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiblock/default_uiblock_loader.dart';

typedef Widget ChildBuilder(BuildContext context);

/// default ui block modal with default loader
class UIBlockModal extends PopupRoute<void> {
  UIBlockModal({
    this.childBuilder,
    this.customLoaderChild,
    this.loadingTextWidget,
    this.backgroundColor,
    this.canDissmissOnBack,
    ImageFilter imageFilter,
  }) : super(filter: imageFilter) {
    customLoaderChild ??= UIBlockDefaultLoader();
    loadingTextWidget ??= Container();
    childBuilder ??= _buildLoader;
    backgroundColor ??= Colors.transparent;
    canDissmissOnBack ??= false;
  }

  ImageFilter imageFilter;

  /// a function to build the body of loader page
  ChildBuilder childBuilder;

  /// a custom loader widget to show in place of default loader
  Widget customLoaderChild;

  /// show custom text widget below default loader
  Widget loadingTextWidget;

  Color backgroundColor;
  Duration transitionDurationVal;
  bool canDissmissOnBack;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get canPop => canDissmissOnBack;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black12;

  @override
  String get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return WillPopScope(
      onWillPop: () async {
        return canDissmissOnBack;
      },
      child: SafeArea(
        child: Material(
          type: MaterialType.canvas,
          elevation: 1.0,
          color: backgroundColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: childBuilder(context),
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          customLoaderChild,
          loadingTextWidget,
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    // Create transition from bottom to top, like bottom sheet
    return SlideTransition(
      position: CurvedAnimation(
        parent: animation,
        curve: Curves.fastLinearToSlowEaseIn,
      ).drive(
        Tween<Offset>(
          begin: Offset(0.0, 10.0),
          end: Offset(0.0, 0.0),
        ),
      ),
      child: child,
    );
  }
}
