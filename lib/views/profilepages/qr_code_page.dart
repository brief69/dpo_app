

// qr_code_page.dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QrCodePage extends StatelessWidget {
  final String publicKey;

  const QrCodePage({super.key, required this.publicKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code')),
      body: Center(
        child: QrImageView(
          data: publicKey,
          version: QrVersions.auto,
          size: 200.0,
          
          
        ),
      ),
    );
  }
}

