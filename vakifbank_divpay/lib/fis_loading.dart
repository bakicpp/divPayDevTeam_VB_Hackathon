import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vakifbank_divpay/card_1_page.dart';
import 'package:vakifbank_divpay/const.dart';
import 'package:vakifbank_divpay/create_card.dart';
import 'package:vakifbank_divpay/main.dart';

class FisLoad extends StatefulWidget {
  const FisLoad({super.key});

  @override
  State<FisLoad> createState() => _FisLoadState();
}

class _FisLoadState extends State<FisLoad> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 750), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Card1Page()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Center(
                child: SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                  duration: Duration(milliseconds: 2400),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text("Yükleniyor..."),
              )
            ],
          )
        ],
      ),
    );
  }
}
