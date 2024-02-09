import 'package:biggestatheart/Helpers/Widgets/standard_widgets.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pdfWid;
import 'package:pdf/pdf.dart';
import 'dart:typed_data';
import 'package:printing/printing.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import '../Helpers/Firebase_Services/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Helpers/Authentication/auth_service.dart';
import '../Helpers/Firebase_Services/certificate.dart';
import 'package:intl/intl.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({Key? key}) : super(key: key);

  @override
  _CertificatePageState createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  Uint8List? _pdfData;
  final firebaseService = FirebaseServiceHome();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (auth.currentUser == null) {
      return const NoticeDialog(
          content: 'You must be logged in to view your certificate');
    } else {
      print(auth.currentUser!.uid);
      return FutureBuilder(
        future: firebaseService.getUser(auth.currentUser!.uid),
        builder: ((context, snapshotUser) {
          if (snapshotUser.hasData) {
            return Scaffold(
                appBar: AppBar(
                  leading: backButton(),
                  centerTitle: true,
                  title: const Text('Certificate',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  backgroundColor: const Color.fromARGB(255, 168, 49, 85),
                ),
                body: PdfPreview(
                  build: (format) => _createPdf(format, snapshotUser.data!.name,
                      snapshotUser.data!.totalHours),
                ));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      );
    }
  }

  Future<Uint8List> _createPdf(
      PdfPageFormat format, String name, int totalHours) async {
    final pdf = pdfWid.Document(
      version: PdfVersion.pdf_1_4,
      compress: true,
    );

    final Uint8List logoImage =
        (await rootBundle.load('assets/images/Logo.png')).buffer.asUint8List();
    final pdfWid.MemoryImage logoMemoryImage = pdfWid.MemoryImage(logoImage);

    final Uint8List signatureImage =
        (await rootBundle.load('assets/images/signature.png'))
            .buffer
            .asUint8List();
    final pdfWid.MemoryImage signatureMemoryImage =
        pdfWid.MemoryImage(signatureImage);

    pdf.addPage(
      pdfWid.Page(
        pageFormat: format,
        build: (context) {
          return pdfWid.SizedBox(
            width: double.infinity,
            child: pdfWid.FittedBox(
              child: pdfWid.Column(
                mainAxisAlignment: pdfWid.MainAxisAlignment.center,
                children: [
                  pdfWid.Container(
                    width: 150,
                    height: 150,
                    child: pdfWid.Image(logoMemoryImage),
                  ),
                  pdfWid.SizedBox(height: 20),
                  pdfWid.Text("Big At Heart certifies that",
                      style: pdfWid.TextStyle(
                          fontSize: 35, fontWeight: pdfWid.FontWeight.bold)),
                  pdfWid.SizedBox(height: 60),
                  pdfWid.Container(
                    width: 250,
                    height: 1.5,
                    margin: pdfWid.EdgeInsets.symmetric(vertical: 5),
                    color: PdfColors.black,
                  ),
                  pdfWid.Container(
                    //width: 300,
                    child: pdfWid.Text(
                      name.trim(),
                      style: pdfWid.TextStyle(
                        fontSize: 30,
                        fontWeight: pdfWid.FontWeight.bold,
                      ),
                    ),
                  ),
                  pdfWid.Container(
                    width: 250,
                    height: 1.5,
                    margin: pdfWid.EdgeInsets.symmetric(vertical: 10),
                    color: PdfColors.black,
                  ),
                  pdfWid.SizedBox(height: 60),
                  pdfWid.Text(
                    "has completed",
                    style: pdfWid.TextStyle(
                      fontSize: 25,
                      fontWeight: pdfWid.FontWeight.bold,
                    ),
                  ),
                  pdfWid.Text(
                    "$totalHours hours of volunteering work",
                    style: pdfWid.TextStyle(
                      fontSize: 25,
                      fontWeight: pdfWid.FontWeight.bold,
                    ),
                  ),
                  pdfWid.SizedBox(height: 100),
                  pdfWid.Container(
                    child: pdfWid.Row(
                      mainAxisAlignment: pdfWid.MainAxisAlignment.end,
                      children: [
                        pdfWid.SizedBox(width: 350),
                        pdfWid.Column(
                          children: [
                            pdfWid.Text(
                              DateFormat('dd/MM/yyyy').format(DateTime.now()),
                              style: pdfWid.TextStyle(
                                fontSize: 20,
                                fontWeight: pdfWid.FontWeight.bold,
                              ),
                            ),
                            pdfWid.SizedBox(height: 20),
                            pdfWid.Container(
                              width: 150,
                              height: 80,
                              child: pdfWid.Image(signatureMemoryImage),
                            ),
                            pdfWid.SizedBox(height: 20),
                            pdfWid.Text(
                              "Big At Heart",
                              style: pdfWid.TextStyle(
                                fontSize: 20,
                                fontWeight: pdfWid.FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
    return pdf.save();
  }

  Widget backButton() {
    return Container(
        alignment: Alignment.topLeft,
        child: IconButton(
            color: Colors.white,
            iconSize: 35,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)));
  }
}
