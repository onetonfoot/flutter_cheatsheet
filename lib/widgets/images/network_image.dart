import 'package:flutter/material.dart';

// It's not clear how to handling cases where a invalid URL or timeout
// https://stackoverflow.com/questions/52568872/flutter-how-to-handle-image-network-error-like-404-or-wrong-url/56513785
// https://github.com/flutter/flutter/issues/34451

class MyNetworkImage extends StatelessWidget {
  final String url = "https://cdn2.thecatapi.com/images/7ru.gif";
  // Example of a invalid URL even wrapping on try catch fail
  // final String url = "https://cn2.catapi.com/images/7ru.gif";

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      scale: 1.0,
      repeat: ImageRepeat.noRepeat,
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent loadingProgress) {
        if (loadingProgress == null) {
          return Center(child: child);
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes
                : null,
          ),
        );
      },
    );
  }
}
