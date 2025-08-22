import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ktoapp/core/utils/log.dart';

class BetradarWidget extends StatefulWidget {
  final int matchId;
  final String htmlData;
  final String referDomain;

  const BetradarWidget({
    super.key,
    required this.matchId,
    required this.htmlData,
    required this.referDomain,
  });

  @override
  _WebViewPageState createState() => _WebViewPageState();
}
//ktobr
//fetch(`https://settings-api.kambicdn.com/${offering}__visualisation.json`)

//https://us1.offering-api.kambicdn.com/offering/v2018/ktobr/statistics/event/1024483445.json?externalEventProvider=EP_BETRADAR

class _WebViewPageState extends State<BetradarWidget> {
  InAppWebViewController? webViewController;
  double _height = 0; // 初始预估
  Timer? _debounce;

  static const double _minHeight = 0;
  static const double _maxHeightFactor = 1; // 屏幕 90%
  @override
  void dispose() {
    _debounce?.cancel();

    super.dispose();
  }

  void _onReceivedHeight(dynamic raw) {
    double? newHeight;
    if (raw is num) {
      newHeight = raw.toDouble();
    } else if (raw is String) {
      newHeight = double.tryParse(raw);
    }
    if (newHeight == null) return;
    final screenMax = MediaQuery.of(context).size.height * _maxHeightFactor;
    newHeight = newHeight.clamp(_minHeight, screenMax);
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      if (mounted && (_height - newHeight!).abs() > 1) {
        setState(() {
          _height = newHeight!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      height: _height,
      // color: Color(0xff1e1e1e),
      child: InAppWebView(
        initialData: InAppWebViewInitialData(
          data: widget.htmlData,
          baseUrl: WebUri(widget.referDomain),
          historyUrl: WebUri(widget.referDomain),
          mimeType: 'text/html',
          encoding: 'utf8',
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          webViewController = controller;
          _registerJavaScriptHandlers(controller);
        },
        onLoadStop: (controller, url) {
          loggerNoStack.d('WebView loaded: $url');
        },
        onConsoleMessage: (controller, consoleMessage) {
          loggerNoStack.d('Console: ${consoleMessage.message}');
        },
        onReceivedServerTrustAuthRequest: (controller, challenge) async {
          return ServerTrustAuthResponse(
            action: ServerTrustAuthResponseAction.PROCEED,
          );
        },
        onContentSizeChanged: (controller, oldContentSize, newContentSize) {
          loggerNoStack.d(">>>>>>>> $oldContentSize, $newContentSize ");
        },
        shouldInterceptRequest: (controller, request) async {
          loggerNoStack.d(">>>>>>>>> ${request.url.toString()}");
          return null;
        },
        onLoadResourceWithCustomScheme: (controller, request) async {
          loggerNoStack.d(">>>>>>>>> 2 ${request.url.toString()}");
          return null;
        },
      ),
    );
  }

  void _registerJavaScriptHandlers(InAppWebViewController controller) {
    controller.addJavaScriptHandler(
      handlerName: 'message',
      callback: (args) {
        loggerNoStack.d(">>>>>>>>>>>>> message from html：  ${args}");
        _handleMessage(args);
        return null;
      },
    );
  }

  void _handleMessage(dynamic args) {
    if (args is List && args.isNotEmpty) {
      final raw = args[0];
      if (raw is Map) {
        switch (raw["type"]) {
          case "height":
            _onReceivedHeight(raw["data"]);
        }
      }
    }
  }

  void _sendMessageToJS() async {
    if (webViewController != null) {
      final message = '61800504';
      await webViewController!.evaluateJavascript(
        source: "receiveFlutterMessage('$message')",
      );
    }
  }
}
