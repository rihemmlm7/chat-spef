import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart'; // Pour les fichiers PDF

class PDFViewerPage extends StatefulWidget {
  final File pdfFile;

  const PDFViewerPage({super.key, required this.pdfFile});

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  late PdfController _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openFile(widget.pdfFile.path),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Document PDF'),
      ),
      body: PdfView(
        controller: _pdfController,
      ),
    );
  }
}
