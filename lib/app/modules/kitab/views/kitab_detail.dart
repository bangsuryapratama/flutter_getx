import 'package:aplikasi_saya/app/data/models/alquran.dart';
import 'package:flutter/material.dart';


class KitabDetailView extends StatelessWidget {
  final AlquranData item;
  const KitabDetailView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.nama ?? "Detail Surah"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Asma (Arab) besar di tengah
            Text(
              item.asma ?? '',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Nama + Arti
            Text(
              item.nama ?? '',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "(${item.arti ?? '-'})",
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // Informasi dalam Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoRow("Jumlah Ayat", "${item.ayat ?? 0}"),
                    const Divider(),
                    _buildInfoRow("Jenis", item.type.toString().split('.').last),
                    const Divider(),
                    _buildInfoRow("Urutan Turun", "${item.urut ?? '-'}"),
                    const Divider(),
                    _buildInfoRow("Rukuk", "${item.rukuk ?? '-'}"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Keterangan
            if (item.keterangan != null && item.keterangan!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Keterangan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item.keterangan!,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            // Tombol Audio
            if (item.audio != null && item.audio!.isNotEmpty)
              ElevatedButton.icon(
                onPressed: () {
                  // TODO: Tambahkan fungsi play audio
                },
                icon: const Icon(Icons.play_arrow),
                label: const Text("Putar Audio"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 24,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  /// Widget helper untuk membuat baris informasi
  Widget _buildInfoRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
