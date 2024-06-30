import 'package:flutter/material.dart';

class PdfListScreen extends StatelessWidget {
  final List<PdfFile> pdfFiles = [
    PdfFile(
      title: 'ETAT_FactureA4.pdf',
      size: '50 ko',
      date: '02/03/2024',
      icon: Icons.picture_as_pdf,
    ),
    PdfFile(
      title: 'Reçu de paiement 240435836.pdf',
      size: '12 ko',
      date: '18/02/2024',
      icon: Icons.picture_as_pdf,
    ),
  ];

  PdfListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pdfFiles.length,
        itemBuilder: (context, index) {
          return PdfFileListItem(pdfFile: pdfFiles[index]);
        },
      ),
    );
  }
}

class PdfFileListItem extends StatelessWidget {
  final PdfFile pdfFile;

  const PdfFileListItem({super.key, required this.pdfFile});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        pdfFile.icon,
        color: Colors.red,
        size: 36,
      ),
      title: Text(pdfFile.title),
      subtitle: Row(
        children: [
          Text(pdfFile.size),
          const SizedBox(width: 16),
          Text(pdfFile.date),
        ],
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}

class PdfFile {
  final String title;
  final String size;
  final String date;
  final IconData icon;

  PdfFile({
    required this.title,
    required this.size,
    required this.date,
    required this.icon,
  });
}
