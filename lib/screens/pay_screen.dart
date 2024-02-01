import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/completed_order_model.dart';
import 'package:squeeky/screens/basket.dart';
import 'package:squeeky/screens/placing_order.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatelessWidget {
   String userId; List<dynamic> businessData; String total, subtotal, serviceFee, businessName;
   PaymentScreen({Key? key, required this.userId, required this.businessData, required this.total, required this.subtotal, required this.businessName, required this.serviceFee}) : super(key: key);
  
  final controller = WebViewController()
  ..setJavaScriptMode(JavaScriptMode.unrestricted)
  ..setBackgroundColor(const Color(0x00000000))
  ;
  // ..loadRequest(Uri.parse('https://squeeky.org/apipaypal/pay2/?user_id=$jjs'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SqueekyClean"),
      ),
      body: WebViewWidget(
        controller: controller..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // Update loading bar.
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (WebResourceError error) {},
      onNavigationRequest: (NavigationRequest request)async {
        Uri responseUri = Uri.parse(request.url);

        if (request.url.startsWith('http://success-squeek-flutter')) {
          // String? amount = await responseUri.queryParameters['amount'];
          Get.to(()=>PlacingOrderSreen(paidOrders: businessData, businessName: businessName, serviceFee: serviceFee, subtotal: subtotal, total: total,));
          return NavigationDecision.prevent;
        }else if(request.url.startsWith('http://error-squeek-pay')){

          return NavigationDecision.prevent;
        }
        return NavigationDecision.navigate;
      },
    ),
  )..loadRequest(Uri.parse("https://squeeky.org/paypal/index.php?user_id=${userId}")),
        
      ),
    );
  }
}