import 'package:flutter/material.dart';

class LoadingDialog {
  LoadingDialog._sharedInstance();
  static final _shared = LoadingDialog._sharedInstance();
  factory LoadingDialog.instance() => _shared;

  var isShowing = false;
  OverlayEntry? _overlayEntry;

  void show(BuildContext context) {
    if (!isShowing) {
      _showLoadingOverlay(context);
    }
  }

  void hide() {
    if (isShowing) {
      _overlayEntry?.remove();
      isShowing = false;
    }
  }

  void _showLoadingOverlay(BuildContext context) {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withAlpha(150),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: size.width * 0.8,
              maxHeight: size.height * 0.2,
              minWidth: size.width * 0.5,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Loading..."),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
    isShowing = true;
  }
}
