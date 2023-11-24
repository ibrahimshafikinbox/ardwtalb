// ignore_for_file: file_names

import 'package:url_launcher/url_launcher.dart';

void openWhatsApp(String phoneNumber) async {
  String url = "https://wa.me/$phoneNumber";

  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    // Handle error
  }
}

void makePhoneCall(phonenumber) async {
  // ignore: deprecated_member_use
  if (await canLaunch('tel:$phonenumber')) {
    // ignore: deprecated_member_use
    await launch('tel:$phonenumber').then((value) {}).catchError((onError) {
      // print(onError.toString());
    });
  } else {
    throw 'Could not launch $phonenumber';
  }
}
