import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiblock/default_uiblock_loader.dart';

typedef Widget ChildBuilder(BuildContext context);
typedef Widget BuildBlockModalTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child);

/// default ui block modal with default loader
class UIBlockModal<T> extends PopupRoute<T> {
  UIBlockModal({
    this.childBuilder,
    this.customLoaderChild,
    this.loadingTextWidget,
    this.backgroundColor,
    this.canDissmissOnBack,
    this.left,
    this.top,
    this.right,
    this.bottom,
    this.minimum,
    this.maintainBottomViewPadding,
    this.buildBlockModalTransitions,
    this.isSlideTransitionDefault,
    ImageFilter? imageFilter,
  }) : super(filter: imageFilter) {
    customLoaderChild ??= UIBlockDefaultLoader();
    loadingTextWidget ??= Container();
    childBuilder ??= _buildLoader;
    backgroundColor ??= Colors.transparent;
    canDissmissOnBack ??= false;
    left ??= true;
    top ??= true;
    right ??= true;
    bottom ??= true;
    minimum ??= EdgeInsets.zero;
    maintainBottomViewPadding ??= false;
    isSlideTransitionDefault ??= true;
  }

  ImageFilter? imageFilter;

  /// a function to build the body of loader page
  ChildBuilder? childBuilder;

  /// a custom loader widget to show in place of default loader
  Widget? customLoaderChild;

  /// show custom text widget below default loader
  Widget? loadingTextWidget;

  Color? backgroundColor;
  Duration? transitionDurationVal;
  bool? canDissmissOnBack;

  /// Whether to avoid system intrusions on the left.
  bool? left;

  /// Whether to avoid system intrusions at the top of the screen, typically the
  /// system status bar.
  bool? top;

  /// Whether to avoid system intrusions on the right.
  bool? right;

  /// Whether to avoid system intrusions on the bottom side of the screen.
  bool? bottom;

  /// This minimum padding to apply.
  ///
  /// The greater of the minimum insets and the media padding will be applied.
  EdgeInsets? minimum;

  /// Specifies whether the [SafeArea] should maintain the
  /// [MediaQueryData.viewPadding] instead of the [MediaQueryData.padding] when
  /// consumed by the [MediaQueryData.viewInsets] of the current context's
  /// [MediaQuery], defaults to false.
  ///
  /// For example, if there is an onscreen keyboard displayed above the
  /// SafeArea, the padding can be maintained below the obstruction rather than
  /// being consumed. This can be helpful in cases where your layout contains
  /// flexible widgets, which could visibly move when opening a software
  /// keyboard due to the change in the padding value. Setting this to true will
  /// avoid the UI shift.
  bool? maintainBottomViewPadding;

  // provide this to give custom transition to block modal
  BuildBlockModalTransitions? buildBlockModalTransitions;

  bool? isSlideTransitionDefault;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  bool get canPop => canDissmissOnBack!;

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black12;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    // This makes sure that text and other content follows the material style
    return WillPopScope(
      onWillPop: () async {
        return canDissmissOnBack!;
      },
      child: SafeArea(
        top: top!,
        bottom: bottom!,
        left: left!,
        right: right!,
        maintainBottomViewPadding: maintainBottomViewPadding!,
        minimum: minimum!,
        child: Material(
          type: MaterialType.canvas,
          elevation: 1.0,
          color: backgroundColor,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: childBuilder!(context),
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          customLoaderChild!,
          loadingTextWidget!,
        ],
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (buildBlockModalTransitions != null) {
      return buildBlockModalTransitions!(
          context, animation, secondaryAnimation, child);
    }

    if (isSlideTransitionDefault!) {
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

    // Create fade transition effect
    return FadeTransition(opacity: animation, child: child);
  }
}
