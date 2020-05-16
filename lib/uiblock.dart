library uiblock;

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uiblock/default_uiblock_loader.dart';
import 'package:uiblock/uiblock_modal.dart';

typedef AsyncChildBuilder<T> = Widget Function(
    BuildContext context, AsyncSnapshot<T> snapshot);

class UIBlock extends StatelessWidget {
  UIBlock({
    Key key,
    @required this.builder,
    @required this.loadingStateFromFuture,
    this.loaderBuilder,
    this.customLoaderChild,
    this.loadingTextWidget,
    this.offset,
    this.barrierOpacity = 0.4,
    this.barrierColor = Colors.black45,
    this.canDissmiss = false,
    this.hideBuilderOnNullData = false,
  })  : assert(builder != null),
        assert(loadingStateFromFuture != null),
        super(key: key);

  /// a function to build the body of block page
  final ChildBuilder loaderBuilder;

  /// a custom loader widget to show in place of default loader
  final Widget customLoaderChild;

  /// show custom text widget below default loader
  final Widget loadingTextWidget;

  /// child widget to show underneath the loader barrier
  final AsyncChildBuilder builder;

  /// Future<dynamic> to auto uiblock and unblock.
  /// Blocks UI if future.value is null
  /// Unblocks UI if future hasData or hasError
  final Future<dynamic> Function() loadingStateFromFuture;
  final double barrierOpacity;
  final Color barrierColor;
  final Offset offset;
  final bool canDissmiss;

  /// whether to show or hide builder func data when ui is blocked
  final bool hideBuilderOnNullData;

  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: WillPopScope(
        onWillPop: () async {
          return canDissmiss;
        },
        child: FutureBuilder<dynamic>(
          future: loadingStateFromFuture(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData || snapshot.hasError) {
              return builder(context, snapshot);
            } else {
              return new Stack(
                children: [
                  !hideBuilderOnNullData
                      ? builder(context, snapshot)
                      : Container(),
                  Opacity(
                    opacity: barrierOpacity,
                    child: ModalBarrier(
                      dismissible: canDissmiss,
                      color: barrierColor,
                    ),
                  ),
                  _buildLoader(context),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoader(BuildContext context) {
    if (loaderBuilder != null) {
      return loaderBuilder(context);
    }

    final _defaultLoader = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        customLoaderChild != null ? customLoaderChild : UIBlockDefaultLoader(),
        loadingTextWidget != null ? loadingTextWidget : Container(),
      ],
    );

    if (offset != null) {
      return Positioned(
        child: _defaultLoader,
        left: offset.dx,
        top: offset.dy,
      );
    }

    return Center(
      child: _defaultLoader,
    );
  }

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
