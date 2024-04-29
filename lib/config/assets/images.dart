// Flutter imports:
import 'package:flutter/material.dart';

const String _imagePath = 'assets/images';

class _Image extends AssetImage {
  const _Image(String fileName) : super('$_imagePath/$fileName');
}

class AppImages {
  static const thumbnail = _Image('thumbnail.png');

  static Future<void> precacheAssets(BuildContext context) async {
    await precacheImage(thumbnail, context);
  }
}
