import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ResultsScreenView extends GetView {
  const ResultsScreenView({super.key, required this.name, required this.gender, required this.dateOfBirth, required this.phone});
  final String name, gender, phone;
  final DateTime dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF667EEA), Color(0xFF764BA2)], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Hero(
                tag: "resultCard",
                child: Card(
                  elevation: 15,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Avatar
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: gender.toLowerCase() == "laki-laki" ? [Colors.blue.shade300, Colors.blue.shade600] : [Colors.pink.shade300, Colors.pink.shade600]),
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [BoxShadow(color: (gender.toLowerCase() == "laki-laki" ? Colors.blue : Colors.pink).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
                          ),
                          child: Icon(gender.toLowerCase() == "laki-laki" ? Icons.male : Icons.female, size: 40, color: Colors.white),
                        ),
                        const SizedBox(height: 20),

                        // Name
                        Text(name, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87)),
                        const SizedBox(height: 6),

                        // Gender Badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: gender.toLowerCase() == "laki-laki" ? Colors.blue.shade50 : Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: gender.toLowerCase() == "laki-laki" ? Colors.blue.shade200 : Colors.pink.shade200),
                          ),
                          child: Text(gender, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: gender.toLowerCase() == "laki-laki" ? Colors.blue.shade700 : Colors.pink.shade700)),
                        ),

                        const Divider(height: 30, thickness: 1.2),

                        // Info Cards
                        _buildInfoTile(Icons.cake, "Tanggal Lahir", DateFormat('dd MMMM yyyy').format(dateOfBirth)),
                        _buildInfoTile(Icons.phone, "Nomor HP", phone),

                        const SizedBox(height: 25),

                        // Back Button
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xFF667EEA), Color(0xFF764BA2)]),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(color: const Color(0xFF667EEA).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            label: const Text("Kembali", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.indigo.shade50, borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.all(10),
            child: Icon(icon, color: Colors.indigo, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.black54)),
                const SizedBox(height: 3),
                Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87)),
              ],
            ),
          )
        ],
      ),
    );
  }
}