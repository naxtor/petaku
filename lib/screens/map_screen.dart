import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: Uri.dataFromString(
              '<html><body><iframe width="100%" height="100%" src="https://maps.google.com/maps?output=embed"></iframe></body></html>',
              mimeType: 'text/html')
          .toString(),
    );
  }
}
