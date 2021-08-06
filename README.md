# uiblock
[![pub package publisher](https://img.shields.io/badge/pub.dev-01579b.svg?style=flat-square&logo=dart&logoColor=white)](https://pub.dev/publishers/hey24sheep.com/packages)
[![pub package](https://img.shields.io/pub/v/uiblock.svg?style=flat-square)](https://pub.dartlang.org/packages/uiblock)
[![GitHub Stars](https://img.shields.io/github/stars/hey24sheep/uiblock.svg?style=flat-square&?logo=github)](https://github.com/hey24sheep/uiblock)
[![Platform](https://img.shields.io/badge/platform-android%20|%20ios-green.svg?style=flat-square&color=9cf)](https://img.shields.io/badge/platform-Android%20%7C%20iOS-green.svg)

<a href="https://www.buymeacoffee.com/hey24sheep" target="_blank"><img src="https://img.shields.io/badge/buy%20me%20a%20coffee-F5E800.svg?style=for-the-badge&logoColor=white&logo=data:image/svg+xml;base64,PHN2ZyByb2xlPSJpbWciIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmlld0JveD0iMCAwIDI0IDI0Ij48dGl0bGU+QnV5IE1lIEEgQ29mZmVlIGljb248L3RpdGxlPjxwYXRoIGQ9Ik0yMC4yMTYgNi40MTVsLS4xMzItLjY2NmMtLjExOS0uNTk4LS4zODgtMS4xNjMtMS4wMDEtMS4zNzktLjE5Ny0uMDY5LS40Mi0uMDk4LS41Ny0uMjQxLS4xNTItLjE0My0uMTk2LS4zNjYtLjIzMS0uNTcyLS4wNjUtLjM3OC0uMTI1LS43NTYtLjE5Mi0xLjEzMy0uMDU3LS4zMjUtLjEwMi0uNjktLjI1LS45ODctLjE5NS0uNC0uNTk3LS42MzQtLjk5Ni0uNzg4YTUuNzIzIDUuNzIzIDAgMDAtLjYyNi0uMTk0Yy0xLS4yNjMtMi4wNS0uMzYtMy4wNzctLjQxNmEyNS44MzQgMjUuODM0IDAgMDAtMy43LjA2MmMtLjkxNS4wODMtMS44OC4xODQtMi43NS41LS4zMTguMTE2LS42NDYuMjU2LS44ODguNTAxLS4yOTcuMzAyLS4zOTMuNzctLjE3NyAxLjE0Ni4xNTQuMjY3LjQxNS40NTYuNjkyLjU4LjM2LjE2Mi43MzcuMjg0IDEuMTIzLjM2NiAxLjA3NS4yMzggMi4xODkuMzMxIDMuMjg3LjM3IDEuMjE4LjA1IDIuNDM3LjAxIDMuNjUtLjExOC4yOTktLjAzMy41OTgtLjA3My44OTYtLjExOS4zNTItLjA1NC41NzgtLjUxMy40NzQtLjgzNC0uMTI0LS4zODMtLjQ1Ny0uNTMxLS44MzQtLjQ3My0uNDY2LjA3NC0uOTYuMTA4LTEuMzgyLjE0Ni0xLjE3Ny4wOC0yLjM1OC4wODItMy41MzYuMDA2YTIyLjIyOCAyMi4yMjggMCAwMS0xLjE1Ny0uMTA3Yy0uMDg2LS4wMS0uMTgtLjAyNS0uMjU4LS4wMzYtLjI0My0uMDM2LS40ODQtLjA4LS43MjQtLjEzLS4xMTEtLjAyNy0uMTExLS4xODUgMC0uMjEyaC4wMDVjLjI3Ny0uMDYuNTU3LS4xMDguODM4LS4xNDdoLjAwMmMuMTMxLS4wMDkuMjYzLS4wMzIuMzk0LS4wNDhhMjUuMDc2IDI1LjA3NiAwIDAxMy40MjYtLjEyYy42NzQuMDE5IDEuMzQ3LjA2NyAyLjAxNy4xNDRsLjIyOC4wMzFjLjI2Ny4wNC41MzMuMDg4Ljc5OC4xNDUuMzkyLjA4NS44OTUuMTEzIDEuMDcuNTQyLjA1NS4xMzcuMDguMjg4LjExMS40MzFsLjMxOSAxLjQ4NGEuMjM3LjIzNyAwIDAxLS4xOTkuMjg0aC0uMDAzYy0uMDM3LjAwNi0uMDc1LjAxLS4xMTIuMDE1YTM2LjcwNCAzNi43MDQgMCAwMS00Ljc0My4yOTUgMzcuMDU5IDM3LjA1OSAwIDAxLTQuNjk5LS4zMDRjLS4xNC0uMDE3LS4yOTMtLjA0Mi0uNDE3LS4wNi0uMzI2LS4wNDgtLjY0OS0uMTA4LS45NzMtLjE2MS0uMzkzLS4wNjUtLjc2OC0uMDMyLTEuMTIzLjE2MS0uMjkuMTYtLjUyNy40MDQtLjY3NS43MDEtLjE1NC4zMTYtLjE5OS42Ni0uMjY3IDEtLjA2OS4zNC0uMTc2LjcwNy0uMTM1IDEuMDU2LjA4Ny43NTMuNjEzIDEuMzY1IDEuMzcgMS41MDJhMzkuNjkgMzkuNjkgMCAwMDExLjM0My4zNzYuNDgzLjQ4MyAwIDAxLjUzNS41M2wtLjA3MS42OTctMS4wMTggOS45MDdjLS4wNDEuNDEtLjA0Ny44MzItLjEyNSAxLjIzNy0uMTIyLjYzNy0uNTUzIDEuMDI4LTEuMTgyIDEuMTcxLS41NzcuMTMxLTEuMTY1LjItMS43NTYuMjA1LS42NTYuMDA0LTEuMzEtLjAyNS0xLjk2Ni0uMDIyLS42OTkuMDA0LTEuNTU2LS4wNi0yLjA5NS0uNTgtLjQ3NS0uNDU4LS41NC0xLjE3NC0uNjA1LTEuNzkzbC0uNzMxLTcuMDEzLS4zMjItMy4wOTRjLS4wMzctLjM1MS0uMjg2LS42OTUtLjY3OC0uNjc4LS4zMzYuMDE1LS43MTguMy0uNjc4LjY3OWwuMjI4IDIuMTg1Ljk0OSA5LjExMmMuMTQ3IDEuMzQ0IDEuMTc0IDIuMDY4IDIuNDQ2IDIuMjcyLjc0Mi4xMiAxLjUwMy4xNDQgMi4yNTcuMTU2Ljk2Ni4wMTYgMS45NDIuMDUzIDIuODkyLS4xMjIgMS40MDgtLjI1OCAyLjQ2NS0xLjE5OCAyLjYxNi0yLjY1Ny4zNC0zLjMzMi42ODMtNi42NjMgMS4wMjQtOS45OTVsLjIxNS0yLjA4N2EuNDg0LjQ4NCAwIDAxLjM5LS40MjZjLjQwMi0uMDc4Ljc4Ny0uMjEyIDEuMDc0LS41MTguNDU1LS40ODguNTQ2LTEuMTI0LjM4NS0xLjc2NnptLTEuNDc4Ljc3MmMtLjE0NS4xMzctLjM2My4yMDEtLjU3OC4yMzMtMi40MTYuMzU5LTQuODY2LjU0LTcuMzA4LjQ2LTEuNzQ4LS4wNi0zLjQ3Ny0uMjU0LTUuMjA3LS40OTgtLjE3LS4wMjQtLjM1My0uMDU1LS40Ny0uMTgtLjIyLS4yMzYtLjExMS0uNzEtLjA1NC0uOTk1LjA1Mi0uMjYuMTUyLS42MDkuNDYzLS42NDYuNDg0LS4wNTcgMS4wNDYuMTQ4IDEuNTI2LjIyLjU3Ny4wODggMS4xNTYuMTU5IDEuNzM3LjIxMiAyLjQ4LjIyNiA1LjAwMi4xOSA3LjQ3Mi0uMTQuNDUtLjA2Ljg5OS0uMTMgMS4zNDUtLjIxLjM5OS0uMDcyLjg0LS4yMDYgMS4wOC4yMDYuMTY2LjI4MS4xODguNjU3LjE2Mi45NzRhLjU0NC41NDQgMCAwMS0uMTY5LjM2NHptLTYuMTU5IDMuOWMtLjg2Mi4zNy0xLjg0Ljc4OC0zLjEwOS43ODhhNS44ODQgNS44ODQgMCAwMS0xLjU2OS0uMjE3bC44NzcgOS4wMDRjLjA2NS43OC43MTcgMS4zOCAxLjUgMS4zOCAwIDAgMS4yNDMuMDY1IDEuNjU4LjA2NS40NDcgMCAxLjc4Ni0uMDY1IDEuNzg2LS4wNjUuNzgzIDAgMS40MzQtLjYgMS40OTktMS4zOGwuOTQtOS45NWEzLjk5NiAzLjk5NiAwIDAwLTEuMzIyLS4yMzhjLS44MjYgMC0xLjQ5MS4yODQtMi4yNi42MTN6Ii8+PC9zdmc+&logoColor=white" alt="Buy Me A Coffee" height="41" width="174">
</a>


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

## Installation

With `null-safety`

```dart
      dependencies:
        backdrop_modal_route: ^2.0.1
```

Without `null-safety`
      
```dart
      dependencies:
        backdrop_modal_route: 1.2.0
```
 
## Getting Started

Add the dependency to your project and start using **uiblock** everywhere:

Import the package.

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

### Creating custom block modal transitions (*only applicable on static UIBlock.block*)

```dart
// NOTE : only for on UIBlock.block as this uses Modal Barrier
// widget block is inline widget replacement with loader widget

UIBlock.block(
    //...
    // more code
    customBuildBlockModalTransitions:
        (context, animation, secondaryAnimation, child) {
        return RotationTransition(
            turns: animation,
            child: child,
        );
    },
    // ...
);
```

 ## Using with data return

 ``` dart
 // NOTE : canDissmissOnBack is alaways true
  var result = await UIBlock.blockWithData(
            _scaffoldGlobalKey.currentContext,
            loadingTextWidget: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                onPressed: () {
                    // unblock and return data
                    UIBlock.unblockWithData(context, "hello world");
                },
                child: Text(
                        'Press here to dissmiss with data. Back for null',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        ),
                    ),
                ),
            ),
        );

    print(result);
```

For more details have a look at the other [examples](https://github.com/hey24sheep/uiblock/tree/master/example).

#

## Properties
| Property                          |     Type     |         Default |                                                           Note |
| --------------------------------- | :----------: | --------------: | -------------------------------------------------------------: |
| context (**required**)            | BuildContext |               - |                                                                |
| childBuilder                      |   Function   |               - |                                                                |
| customLoaderChild                 |    Widget    |               - |                                                                |
| loadingTextWidget                 |    Widget    |               - |                                                                |
| imageFilter                       | ImageFilter  |               - |                                                                |
| backgroundColor                   |    Color     |     Transparent |                                                                |
| canDissmissOnBack                 |     bool     |           false |                                                                |
| safeAreaLeft                      |     bool     |            true |                     Set as 'false' to disable 'Left' Safe Area |
| safeAreaTop                       |     bool     |            true | Set as 'false' to disable 'Top' (usually status bar) Safe Area |
| safeAreaRight                     |     bool     |            true |                    Set as 'false' to disable 'Right' Safe Area |
| safeAreaBottom                    |     bool     |            true |                   Set as 'false' to disable 'Bottom' Safe Area |
| safeAreaMinimumPadding            |  EdgeInsets  | EdgeInsets.zero |                                                                |
| safeAreaMaintainBottomViewPadding |     bool     |           false |                                                                |
| isSlideTransitionDefault          |     bool     |            true |                        Toggle between slide or fade transition |
| buildBlockModalTransitions        |   Function   |               - |     Use this to create custom transition other than fade/slide |

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

Check out my other useful packages on [pub.dev](https://pub.dev/publishers/hey24sheep.com/packages)
