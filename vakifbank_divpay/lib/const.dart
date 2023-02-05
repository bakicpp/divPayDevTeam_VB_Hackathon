import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Color mainColor = Color(0xffFCBB02);
Color gray = Color(0xffF9F8FB);
Color textGray = Color(0xffB3ACB8);

final morGrad = LinearGradient(
  colors: [Color(0xff6A1A7E), Color.fromARGB(255, 170, 6, 211)],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final maviGrad = LinearGradient(
  colors: [
    Color(0xff1066B5),
    Color(0xff40A3FF),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final koyuYesilGrad = LinearGradient(
  colors: [
    Color(0xff0A7360),
    Color(0xff0A7360),
  ],
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
);

final yesilGrad = LinearGradient(
  colors: [
    Colors.green,
    Colors.greenAccent,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final turuncuGrad = LinearGradient(
  colors: [
    Colors.orange,
    Colors.amber,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

final basicGrad = LinearGradient(colors: [
  Color(0xff717171),
  Color(0xffC2C2C2),
], begin: Alignment.topCenter, end: Alignment.bottomCenter);

String defKartAdi2 = "Grup Kartın";
String defKartAdi1 = "Grup Kartın";

bool yesil = false;
bool turuncu = false;

double harcama = 0;

bool harcamaGoster = false;

bool card1 = false;

final picker = ImagePicker();

bool purple = false;
