import 'package:flutter/material.dart';

class PayWebView extends StatefulWidget {
  const PayWebView({Key? key}) : super(key: key);

  @override
  State<PayWebView> createState() => _PayWebViewState();
}

class _PayWebViewState extends State<PayWebView> {
  @override
  void initState(){
    super.initState();
    // final args = ModalRoute.of(context)!.settings.arguments as Map;
    print("init web done");
  }
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("payment"),);
  }
}
