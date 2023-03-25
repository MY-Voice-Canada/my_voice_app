// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

// Future<Uint8List> fetchPdfContent(final String url) async {
//   try {
//     final Response<List<int>> response = await Dio().get<List<int>>(
//       url,
//       options: Options(responseType: ResponseType.bytes),
//     );
//     return Uint8List.fromList(response.data!);
//   } catch (e) {
//     return Future.error(e);
//   }
// }

import 'dart:html';

import 'package:dropbox_client/dropbox_client.dart';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart' as pdfview;

final pdfLinks = {
  "PDFISSUE1.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE1.pdf",
  "PDFISSUE2 copy.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE2+copy.pdf",
  "PDFISSUE3.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE3.pdf",
  "PDFISSUE4.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE4.pdf",
  "PDFISSUE5.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE5.pdf",
  "PDFISSUE6.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE6.pdf",
  "PDFISSUE7.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE7.pdf",
  "PDFISSUE8.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE8.pdf",
  "PDFISSUE9.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE9.pdf",
  "PDFISSUE9a.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE9a.pdf",
  "PDFISSUE10.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE10.pdf",
  "PDFISSUE10a.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE10a.pdf",
  "PDFISSUE11.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE11.pdf",
  "PDFISSUE12.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE12.pdf",
  "PDFISSUE13.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE13.pdf",
  "PDFISSUE13a.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE13a.pdf",
  "PDFISSUE14 (1).pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE14+(1).pdf",
  "PDFISSUE14.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE14.pdf",
  "PDFISSUE15a.compressed.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE15a.compressed.pdf",
  "PDFISSUE16.compressed.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE16.compressed.pdf",
  "PDFISSUE17.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE17.pdf",
  "PDFISSUE18.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE18.pdf",
  "PDFISSUE19.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE19.pdf",
  "PDFISSUE20.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE20.pdf",
  "PDFISSUE21.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE21.pdf",
  "PDFISSUE22.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE22.pdf",
  "PDFISSUE23.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE23.pdf",
  "PDFISSUE24.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE24.pdf",
  "PDFISSUE24(compressed-Smallpdf).pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE24(compressed-Smallpdf).pdf",
  "PDFISSUE25.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE25.pdf",
  "PDFISSUE25(compressed-Smallpdf).pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE25(compressed-Smallpdf).pdf",
  "PDFISSUE26.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE26.pdf",
  "PDFISSUE26(compressed-Smallpdf).pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE26(compressed-Smallpdf).pdf",
  "PDFISSUE27.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE27.pdf",
  "PDFISSUE27(compressed-Smallpdf).pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE27(compressed-Smallpdf).pdf",
  "PDFISSUE28.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE28.pdf",
  "PDFISSUE28(compressed-Smallpdf).pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE28(compressed-Smallpdf).pdf",
  "PDFISSUE29.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE29.pdf",
  "PDFISSUE30.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE30.pdf",
  "PDFISSUE31.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE31.pdf",
  "PDFISSUE31(compressed-Smallpdf).pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE31(compressed-Smallpdf).pdf",
  "PDFISSUE32.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE32.pdf",
  "PDFISSUE33.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE33.pdf",
  "PDFISSUE34.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE34.pdf",
  "PDFISSUE35.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE35.pdf",
  "PDFISSUE36.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=PDFISSUE36.pdf",
  "pressquality.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=pressquality.pdf",
  "vol6lss2-Layout-PRINT.pdf":
      "https://www.dropbox.com/sh/i2t7qc86z7zefap/AABZggpwuNufNkKf11nI3Kaya?dl=0&preview=Vol6Iss2-Layout-PRINT.pdf"
};

//url is url of PDF file
class PDFApi {
  static Future<Future<io.File>> loadNetwork(url) async {
    final response = await http.get(url);
    final bytes = response.bodyBytes;

    // want to store bytes inside a file
    return _storeFile(url, bytes);
  }

  //create method to store downloaded file
  static Future<io.File> _storeFile(String url, List<int> bytes) async {
    //get file name
    final filename = basename(url);
    //app directory to store file
    final dir = await getApplicationDocumentsDirectory();

    // create path of where to store file
    final file = io.File('${dir.path}/$filename');

    //store bytes recieved inside the file created
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}

//create PDFViewer page
class PDFViewerPage extends StatefulWidget {
  //file to pdf
  final File file;
  const PDFViewerPage({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  @override
  Widget build(BuildContext context) {
    //access name of file
    final name = basename(widget.file.toString());

    return Scaffold(
        appBar: AppBar(
          //display name of pdf
          title: Text(name),
        ),
        body: pdfview.PDFView(
          filePath: widget.file.toString(),
        ));
  }
}

// we need to choose the url from one of our articles inside async function
// final file = await PDFApi.loadNetwork(url);

// call new method where we store file inside
// openPDF(context, file)

//inside method we call a navigator push and create a new page
void openPDF(BuildContext context, File file) => {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => PDFViewerPage(
                  file: file,
                  key: null,
                )),
      )
    };

//other PDF view page test

