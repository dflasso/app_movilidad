import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

openwhatsapp(BuildContext context, String msg) async {
  var whatsapp = "+593979108482";
  var whatsappURlAndroid = "whatsapp://send?phone=" + whatsapp + "&text=$msg";
  var whatappURLIos = "https://wa.me/$whatsapp?text=${Uri.parse(msg)}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunch(whatappURLIos)) {
      await launch(whatappURLIos, forceSafariVC: false);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("whatsapp no instalado")));
    }
  } else {
    // android , web
    if (await canLaunch(whatsappURlAndroid)) {
      await launch(whatsappURlAndroid);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("whatsapp no Instalado")));
    }
  }
}
