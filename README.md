# uiblock
[![pub package](https://img.shields.io/pub/v/uiblock.svg)](https://pub.dartlang.org/packages/uiblock)
[![GitHub Stars](https://img.shields.io/github/stars/hey24sheep/uiblock.svg?logo=github)](https://github.com/hey24sheep/uiblock)
[![Platform](https://img.shields.io/badge/platform-android%20|%20ios-green.svg)](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)

**Easiest and simplest method to block/unblock ui for your flutter apps.**

**One line of code** to **block/unblock ui** and stop user from navigating during loading or processing in your flutter apps. You could use it as a widget or directly as a global service/util.

- **Fully customizable**
- **Android and IOS**
- **Easy and Simple**
- **No other dependencies**
- **Well documented**
- **Production ready**


<p>
<img src="https://github.com/hey24sheep/uiblock/raw/master/screenshots/example5.gif" width="220" height="440" />
<img src="https://github.com/hey24sheep/uiblock/raw/master/screenshots/example1.gif" width="220" height="440" />
<img src="https://github.com/hey24sheep/uiblock/raw/master/screenshots/example2.gif" width="220" height="440" />
<img src="https://github.com/hey24sheep/uiblock/raw/master/screenshots/example3.gif" width="220" height="440" />
<img src="https://github.com/hey24sheep/uiblock/raw/master/screenshots/example4.gif" width="220" height="440" />
</p>

## Getting Started
Add the dependency `uiblock: ^0.1.0` to your project and start using **uiblock** everywhere:
```dart
import 'package:uiblock/uiblock.dart';
```

To block ui

```dart
 // default
 UIBlock.block(context);
 
 //OR

 // if using globalKey
 UIBlock.block(_scaffoldGlobalKey.currentContext);
```

To unblock ui

```dart
 // call unblock after blockui to dissmiss
 UIBlock.unblock(context);

 //OR

 // if using globalKey
 UIBlock.unblock(_scaffoldGlobalKey.currentContext);
```
#

## Using as a widget

```dart
//toggle showLoader to block/unblock
FlatButton(
    child: Text('Load Async'),
    onPressed: () {
        setState(() {
            showLoader = !showLoader;
        });
    },
),

 // easily create custom block ui body
 Container(
    height: _height,
    child: UIBlock(
        loadingStateFromFuture: () async {
        if (showLoader) {
            // return null, to block ui
            return null;
        }
        // unblocks ui on hasData or hasError
        return Future.value(Random().nextInt(200));
        },
        barrierColor: Colors.blueGrey,
        barrierOpacity: 0.2,
        loadingTextWidget: Text('Loading data...'),
        hideBuilderOnNullData: true,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            return Center(child: Text('Async Data ${snapshot.data}'));
        },
    ),
 );
```

#

### Blocking with text
```dart
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
```


### Creating using child builder

```dart
 // easily create custom block ui body
 UIBlock.block(
     _scaffoldGlobalKey.currentContext,
    backgroundColor: Colors.green.withOpacity(0.5),
    imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
    childBuilder: (BuildContext context) {
        // return your widget here
    },
 );

 // Don't forget to call unblock after block :)
```

For more details have a look at the other [examples](https://github.com/hey24sheep/uiblock/tree/master/example).

#

## Properties
| Property               |     Type     |     Default |
| ---------------------- | :----------: | ----------: |
| context (**required**) | BuildContext |           - |
| childBuilder           |   Function   |           - |
| customLoaderChild      |    Widget    |           - |
| loadingTextWidget      |    Widget    |           - |
| imageFilter            | ImageFilter  |           - |
| backgroundColor        |    Color     | transparent |
| canDissmissOnBack      |     bool     |       false |


## Widget Properties
| Property               |            Type            |                         Default |
| ---------------------- | :------------------------: | ------------------------------: |
| builder                |          Function          |                you implement it |
| loadingStateFromFuture | Future<dynamic> Function() | your future function (APIs,etc) |
| loaderBuilder          |          Function          |                               - |
| customLoaderChild      |           Widget           |                               - |
| loadingTextWidget      |           Widget           |                               - |
| offset                 |           offset           |                               - |
| barrierOpacity         |           double           |                             0.4 |
| barrierColor           |           Color            |                         black45 |
| canDismiss             |            bool            |                           false |
| hideBuilderOnNullData  |            bool            |                           false |

#

## Improve

Help me by reporting bugs, **submit new ideas** for features or anything else that you want to share.

- Just [write an issue](https://github.com/hey24sheep/uiblock/issues) on GitHub. ✏️
- And don't forget to hit the **like button** for this package ✌️
  
## More

Check out my other useful packages on [pub.dev](https://pub.dev/packages?q=email%3Ahey24sheep%40gmail.com)