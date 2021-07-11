import 'package:dwr0001/Application/Station/Select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

// ignore: must_be_immutable
class PdfViewer extends StatefulWidget {
  PdfViewer(this.basinID);
  var basinID;
  @override
  _PdfViewerState createState() => _PdfViewerState(basinID);
}

class _PdfViewerState extends State<PdfViewer> {
  _PdfViewerState(this.basinID);
  var basinID;
  bool _isLoading = true;
  PDFDocument document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  loadDocument() async {
    print(basinID);
    if (basinID == 1) {
      document = await PDFDocument.fromAsset('assets/pdf/mk/mk.pdf');
    } else if (basinID == 2) {
      document = await PDFDocument.fromAsset('assets/pdf/sl/sl.pdf');
    } else {
      document = await PDFDocument.fromAsset('assets/pdf/kk/kk.pdf');
    }

    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: const Text('PDF TeleDWR'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StationOld(basinID)))
            },
          ),
        ),
        body: Center(
            child: Container(
          child: PDFViewer(document: document),
        )),
      ),
    );
  }
}
