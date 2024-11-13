import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:government_service_app/main.dart';
import 'package:government_service_app/screens/home_screen/model/service_model.dart';
import 'package:government_service_app/screens/home_screen/provider/home_provider.dart';
import 'package:provider/provider.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  InAppWebViewController? webViewController;
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    GovServiceModel model =
        ModalRoute.of(context)!.settings.arguments as GovServiceModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("${model.title}"),
        actions: [
          IconButton(
            onPressed: () {
              webViewController?.goBack();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
          ),
          IconButton(
            onPressed: () {
              webViewController?.reload();
            },
            icon: Icon(Icons.refresh_rounded),
          ),
          IconButton(
            onPressed: () {
              webViewController?.goForward();
            },
            icon: Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: hRead.progressValue,
          ),
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri('${model.webUril}')),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                hRead.changeProgressValue(progress / 100);
              },
            ),
          ),
        ],
      ),
    );
  }
}
