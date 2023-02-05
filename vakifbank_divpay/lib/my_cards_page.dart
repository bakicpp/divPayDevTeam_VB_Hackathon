import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vakifbank_divpay/card2_page.dart';
import 'package:vakifbank_divpay/card_1_page.dart';
import 'package:vakifbank_divpay/card_3_page.dart';
import 'package:vakifbank_divpay/card_create_loading_page.dart';
import 'package:vakifbank_divpay/const.dart';
import 'package:vakifbank_divpay/create_card.dart';
import 'package:vakifbank_divpay/main.dart';

class MyCardsPage extends StatefulWidget {
  const MyCardsPage({super.key});

  @override
  State<MyCardsPage> createState() => _MyCardsPageState();
}

List cardIcons = [
  "images/tac.png",
  "images/bosluk.png",
  "images/bosluk.png",
  "images/tac.png"
];

List cardName = [
  "Bradrain Team",
  "Aile",
  "VakıfMobil",
];

List cardPages = [Card1Page(), Card2Page(), Card3Page()];

List cardColor = [
  morGrad,
  maviGrad,
  koyuYesilGrad,
];

List mainAcc = [
  "YÜKSEL BAKİ YUMAK",
  "MELİH SARITAŞ",
  "TOLGA ALKOÇ",
];

class _MyCardsPageState extends State<MyCardsPage> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        bottomSheet: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: pageWidth / 18, vertical: pageHeight / 50),
          child: ElevatedButton(
            onPressed: () {
              cardName.add("divPay Sunum");
              cardColor.add(yesilGrad);
              mainAcc.add("YÜKSEL BAKİ YUMAK");
              cardPages.add(Card3Page());
              cardIcons.add("images/tac.png");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CardCreateLoad()),
              );
            },
            child: Text(
              "GRUP KART OLUŞTUR",
              style: GoogleFonts.inter(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(pageWidth, pageHeight / 20),
                backgroundColor: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
          ),
        ),
        appBar: AppBar(
          backgroundColor: mainColor,
          title: Text(
            "Grup Kartlarım",
            style: GoogleFonts.inter(
                fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
          ),
          centerTitle: true,
          leading: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: pageWidth / 18),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: pageHeight / 50,
                  ),
                  SizedBox(
                    height: cardName.length > 3
                        ? pageHeight / 1.12
                        : pageHeight / 1.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cardName.length,
                      itemBuilder: (context, index) {
                        return Container(
                          transform: index == 0
                              ? Matrix4.translationValues(0.0, 0.0, 0.0)
                              : index == 2
                                  ? Matrix4.translationValues(0.0, -100.0, 0.0)
                                  : index == 3
                                      ? Matrix4.translationValues(
                                          0.0, -150.0, 0.0)
                                      : Matrix4.translationValues(
                                          0.0, -50.0, 0.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => cardPages[index]),
                              );
                            },
                            child: card(
                                pageWidth,
                                pageHeight,
                                cardName[index],
                                cardColor[index],
                                mainAcc[index],
                                cardIcons[index]),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: pageHeight / 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Container card(double pageWidth, double pageHeight, String cardName,
      LinearGradient grad, String name, String icon) {
    return Container(
      width: pageWidth,
      height: pageHeight / 4,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: gray, offset: Offset(0, 4), blurRadius: 4, spreadRadius: 0)
      ], borderRadius: BorderRadius.circular(8), gradient: grad),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: cardHead(cardName, icon),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20,
          ),
          child: isimTxt(name),
        ),
        Spacer(),
        mastercard()
      ]),
    );
  }

  Row cardHead(String cardName, String icon) {
    return Row(
      children: [
        Text(
          cardName,
          style: GoogleFonts.inter(
              color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Image.asset(
          icon,
          scale: 6,
          color: Colors.white70,
        )
      ],
    );
  }

  Row isimTxt(String name) {
    return Row(
      children: [
        Text(
          name,
          style: GoogleFonts.inter(
              color: Colors.white60, fontSize: 10, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }

  Row mastercard() {
    return Row(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            "images/mc.png",
            scale: 30,
          ),
        ),
      ],
    );
  }

  ElevatedButton createButton(double pageWidth, double pageHeight) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CardCreateLoad()),
        );
      },
      child: Text(
        "GRUP KART OLUŞTUR",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  Text text() {
    return Text(
      "Henüz hiçbir grup kart oluşturmadınız ya da hiçbir grup kart üyeliğiniz bulunumuyor.",
      style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}
