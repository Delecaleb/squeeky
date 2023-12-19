import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatelessWidget {
   String userId;
   PaymentScreen({Key? key, required this.userId}) : super(key: key);
  String jjs = 'nokia';
  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request) {
        if (request.url.startsWith('https://www.youtube.com/')) {
          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  );
  // ..loadRequest(Uri.parse('https://learncrib.com.ng/squeeky/api/paypal/pay2/?user_id=$jjs'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqueekyClean"),
      ),
      body: WebViewWidget(
        controller: controller..loadRequest(Uri.parse("https://learncrib.com.ng/squeeky/api/paypal/pay2/?user_id=${userId}")),
        
      ),
    );
  }
}