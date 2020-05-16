# Example

Flutter example of uiblock package.

## Using default uiblock

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
 UIBlock.unblock(_scaffoldGlobalKey.currentContext);
```

## With Text
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

## Creating using child builder

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