import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uiblock/default_uiblock_loader.dart';
import 'package:uiblock/uiblock.dart';

GlobalKey _scaffoldGlobalKey = GlobalKey();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Block Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // could be anything other than string,
  // depends on your BackdropModalRoute<T> return type
  String backdropResult = '';

  // ValueListenable<int> _listenable = ValueListenable();
  ValueNotifier<int> _counter = ValueNotifier<int>(0);

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldGlobalKey,
        appBar: AppBar(
          title: Text('UIBlock Demo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                child: Text('Load Async'),
                onPressed: () {
                  setState(() {
                    showLoader = !showLoader;
                  });
                },
              ),
              Container(
                height: 100,
                child: UIBlock(
                  loadingStateFromFuture: () async {
                    if (showLoader) {
                      // return null, to show loader
                      return null;
                    }
                    // hides loader on hasData or HasError
                    return Future.value(Random().nextInt(200));
                  },
                  barrierColor: Colors.blueGrey,
                  barrierOpacity: 0.2,
                  loadingTextWidget: Text('Loading data...'),
                  hideBuilderOnNullData: true,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return Center(
                      child: Text('Async Data ${snapshot.data}'),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: <Widget>[
                    // default
                    _buildDefault(context),

                    SizedBox(height: 24),

                    // default dissmissible
                    _buildDefaultDissmissible(context),

                    SizedBox(height: 24),

                    // default with text
                    _buildDefaultWithText(context),

                    SizedBox(height: 24),

                    // custom using childBUilder
                    _buildCustomWithChildBuilder(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefault(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          "Default UIBlock (Dissmiss Disabled)",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          UIBlock.block(_scaffoldGlobalKey.currentContext);

          await Future.delayed(Duration(seconds: 3), () => '1');

          UIBlock.unblock(_scaffoldGlobalKey.currentContext);
        },
      ),
    );
  }

  Widget _buildDefaultDissmissible(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          "Default UIBlock (Dissmiss Enabled)",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          UIBlock.block(
            _scaffoldGlobalKey.currentContext,
            canDissmissOnBack: true,
            loadingTextWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Press back to dissmiss',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDefaultWithText(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          "Default UIBlock With Text (Dissmiss Disabled)",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          UIBlock.block(
            _scaffoldGlobalKey.currentContext,
            loadingTextWidget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Cannot pop this loader, will dismiss in 3 seconds',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );

          Future.delayed(
            Duration(seconds: 3),
            () => UIBlock.unblock(_scaffoldGlobalKey.currentContext),
          );
        },
      ),
    );
  }

  Widget _buildCustomWithChildBuilder(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Text(
          "Custom UIBlock With Child Builder & State",
          textAlign: TextAlign.center,
        ),
        onPressed: () async {
          UIBlock.block(
            _scaffoldGlobalKey.currentContext,
            backgroundColor: Colors.green.withOpacity(0.5),
            imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            childBuilder: (BuildContext context) {
              _counter.value = 0;

              // increment counter
              Timer.periodic(Duration(seconds: 1), (timer) async {
                _counter.value++;

                if (_counter.value == 3) {
                  timer.cancel();
                  UIBlock.unblock(context);

                  await Future.delayed(
                      Duration(seconds: 2), () => _counter.value = 0);
                }
              });

              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      UIBlockDefaultLoader(),
                      ValueListenableBuilder<int>(
                        valueListenable: _counter,
                        builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              'Custom loader using "ChildBuilder".\n\n Closing in $value',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
