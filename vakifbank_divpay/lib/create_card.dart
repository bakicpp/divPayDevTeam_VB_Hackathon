import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vakifbank_divpay/add_member_page.dart';
import 'package:vakifbank_divpay/const.dart';
import 'package:vakifbank_divpay/my_cards_page.dart';
import 'package:vakifbank_divpay/no_card_page.dart';

import 'customize_card_page.dart';

class CreateCard extends StatefulWidget {
  const CreateCard({
    super.key,
  });

  @override
  State<CreateCard> createState() => _CreateCardState();
}

bool bolButonlari = false;

class _CreateCardState extends State<CreateCard> {
  @override
  Widget build(BuildContext context) {
    var pageWidth = MediaQuery.of(context).size.width;
    var pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: mainColor,
        title: Text(
          "Grup Kartlarım",
          style: GoogleFonts.inter(
              fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyCardsPage()),
            );
          },
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pageWidth / 18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 40),
                child: card(pageWidth, pageHeight),
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 15),
                child: uyeHead(pageWidth, pageHeight),
              ),
              Divider(
                thickness: 1,
              ),
              user(),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: EdgeInsets.only(top: pageHeight / 4),
                child: addMemberButton(pageWidth, pageHeight),
              ),
              Row(
                children: [
                  esitBolButton(context, pageHeight, pageWidth),
                  SizedBox(
                    width: pageWidth / 50,
                  ),
                  ozelBolButton(context, pageHeight, pageWidth)
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  ElevatedButton ozelBolButton(
      BuildContext context, double pageHeight, double pageWidth) {
    return ElevatedButton(
      onPressed: bolButonlari
          ? () {
              onayPopUp2(context, pageHeight, pageWidth);
            }
          : null,
      child: Text(
        "ÖZEL BÖL",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth / 2.31, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  ElevatedButton esitBolButton(
      BuildContext context, double pageHeight, double pageWidth) {
    return ElevatedButton(
      onPressed: bolButonlari
          ? () {
              onaypopUp(context, pageHeight, pageWidth);
            }
          : null,
      child: Text(
        "EŞİT BÖL",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth / 2.31, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  Future<dynamic> onayPopUp2(
      BuildContext context, double pageHeight, double pageWidth) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: Colors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: pageHeight / 50,
              ),
              Image.asset(
                "images/onay.png",
                scale: 4,
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Text(
                "ÖDEME ONAYI",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff666666)),
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Text(
                "$harcama TL tutarlı divPay Grup Kart yemek harcamanız için grup üyelerine özel bölme işlemini onaylayarak gönderebilirsiniz.",
                style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff666666)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Fiş gör",
                    style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff666666)),
                  ),
                  SizedBox(
                    width: pageWidth / 80,
                  ),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: Colors.white,
                                  actions: [],
                                ));
                      },
                      icon: Icon(
                        Icons.receipt_rounded,
                        color: mainColor,
                      )),
                ],
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Row(
                children: [
                  SizedBox(
                    width: pageWidth / 30,
                  ),
                  MaterialButton(
                      child: Text(
                        "ONAYLA",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minWidth: pageWidth / 1.45,
                      height: pageHeight / 20,
                      color: mainColor,
                      onPressed: () {}),
                ],
              ),
              SizedBox(
                height: pageHeight / 50,
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> onaypopUp(
      BuildContext context, double pageHeight, double pageWidth) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        backgroundColor: Colors.white,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/onay.png",
                scale: 4,
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              Text(
                "ÖDEME ONAYI",
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff666666)),
              ),
              SizedBox(
                height: pageHeight / 80,
              ),
              SizedBox(
                height: pageHeight / 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: pageWidth / 40,
                  ),
                  MaterialButton(
                      child: Text(
                        "EVET",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minWidth: pageWidth / 3,
                      height: pageHeight / 20,
                      color: mainColor,
                      onPressed: () {}),
                  SizedBox(
                    width: pageWidth / 30,
                  ),
                  MaterialButton(
                      child: Text(
                        "HAYIR",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      minWidth: pageWidth / 3,
                      height: pageHeight / 20,
                      color: mainColor,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton addMemberButton(double pageWidth, double pageHeight) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddMember()),
        );
      },
      child: Text(
        "ÜYE EKLE",
        style: GoogleFonts.inter(fontWeight: FontWeight.bold),
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(pageWidth, pageHeight / 20),
          backgroundColor: mainColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
    );
  }

  Row user() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "YÜKSEL BAKİ YUMAK",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xff666666)),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "TR09 0004 6001 6088 8000 1946 12",
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0xff666666)),
                ),
              ],
            )
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "images/tac.png",
            scale: 7,
          ),
        ),
      ],
    );
  }

  Row uyeHead(double pageWidth, double pageHeight) {
    return Row(
      children: [
        Text(
          "Grup Kart Üyeleri",
          style: GoogleFonts.inter(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xffB3ACB8)),
        ),
        Spacer(),
        Container(
          width: pageWidth / 10,
          height: pageHeight / 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: mainColor),
          child: Center(
              child: Text(
            "%100",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
          )),
        ),
        SizedBox(
          width: pageWidth / 50,
        ),
        Container(
          width: pageWidth / 10,
          height: pageHeight / 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4), color: mainColor),
          child: Center(
              child: Text(
            "1/10",
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700, fontSize: 12, color: Colors.white),
          )),
        )
      ],
    );
  }

  Container card(double pageWidth, double pageHeight) {
    return Container(
      width: pageWidth,
      height: pageHeight / 4,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: gray,
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.circular(8),
          gradient: yesil
              ? yesilGrad
              : turuncu
                  ? turuncuGrad
                  : basicGrad),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: cardHead(),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 20.0,
            left: 20,
          ),
          child: isimTxt(),
        ),
        Spacer(),
        mastercard()
      ]),
    );
  }

  Row cardHead() {
    return Row(
      children: [
        Text(
          defKartAdi2,
          style: GoogleFonts.inter(
              color: Colors.white70, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomizeCard()),
            );
          },
          child: Image.asset(
            "images/customize.png",
            scale: 16,
          ),
        )
      ],
    );
  }

  Row isimTxt() {
    return Row(
      children: [
        Text(
          "YÜKSEL BAKİ YUMAK",
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
}
