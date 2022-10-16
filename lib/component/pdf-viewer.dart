import 'package:basicflutter/ProgressHUD.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../model/tableDrawing-model.dart';

class PdfViewer extends StatefulWidget {
  final ReportModel report;
  const PdfViewer({required this.report, Key? key}) : super(key: key);
  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  
bool isApiCallProcess = false;
 final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
 String namePath = 'http://integreata.com/uploads/project/'; 
  @override
  void initState() {
    setState(() {
      isApiCallProcess = true;
    });
    super.initState();
    setState(() {
     namePath =  namePath + widget.report.projectGuId.toString() +'/'+ widget.report.intFileId.toString() +'/'+ widget.report.fileRawName;
      isApiCallProcess = false;
    });
    
  }

   @override
  Widget build(BuildContext context) {
    return ProgressHUD(inAsyncCall: isApiCallProcess, child: _uiSetup(context));
  }

  Widget _uiSetup(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Namepdf'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        namePath ,
        key: _pdfViewerKey,
      ),
    );
  }
}
