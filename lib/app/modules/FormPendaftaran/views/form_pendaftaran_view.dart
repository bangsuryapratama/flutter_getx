import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FormPendaftaranController());

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Form Pendaftaran', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        backgroundColor: const Color(0xFF667EEA),
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 15, offset: const Offset(0, 5))],
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Input Nama
              Obx(() => _buildInputField(
                label: "Nama Lengkap",
                hint: "Masukkan nama lengkap",
                icon: Icons.person_outline,
                errorText: controller.namaError.value.isEmpty ? null : controller.namaError.value,
                onChanged: (value) {
                  controller.name.value = value;
                  controller.validateName(name: value);
                },
              )),

              const SizedBox(height: 20),

              // Dropdown Gender
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Jenis Kelamin", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: controller.gender.value.isEmpty ? null : controller.gender.value,
                    decoration: _inputDecoration("Pilih jenis kelamin", Icons.people_outline, controller.genderError.value.isEmpty ? null : controller.genderError.value),
                    items: ['Laki-laki', 'Perempuan'].map((gender) => DropdownMenuItem(value: gender, child: Text(gender))).toList(),
                    onChanged: (value) {
                      controller.gender.value = value ?? '';
                      controller.validateGender(jenisKelamin: value ?? '');
                    },
                  ),
                ],
              )),

              const SizedBox(height: 20),

              // Date Picker
              Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Tanggal Lahir", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2005, 1, 1),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        controller.dateofBirth.value = selectedDate;
                        controller.validateDateOfBirth(tanggalLahir: selectedDate);
                      }
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: _inputDecoration(
                          "Pilih tanggal lahir",
                          Icons.cake_outlined,
                          controller.dateofBirthError.value.isEmpty ? null : controller.dateofBirthError.value,
                        ),
                        controller: TextEditingController(
                          text: controller.dateofBirth.value == null ? "" : DateFormat('dd-MM-yyyy').format(controller.dateofBirth.value!),
                        ),
                      ),
                    ),
                  ),
                ],
              )),

              const SizedBox(height: 20),

              // Input Telepon
              Obx(() => _buildInputField(
                label: "Nomor Telepon",
                hint: "Masukkan nomor telepon",
                icon: Icons.phone_android_outlined,
                errorText: controller.phoneError.value.isEmpty ? null : controller.phoneError.value,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  controller.phone.value = value;
                  controller.validatePhone(phone: value);
                },
              )),

              const SizedBox(height: 35),

              // Submit Button
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [Color(0xFF667EEA), Color(0xFF764BA2)]),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: const Color(0xFF667EEA).withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 5))],
                ),
                child: ElevatedButton(
                  onPressed: () => controller.submitForm(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Text("KIRIM", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({required String label, required String hint, required IconData icon, required Function(String) onChanged, String? errorText, TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(keyboardType: keyboardType, onChanged: onChanged, decoration: _inputDecoration(hint, icon, errorText)),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon, String? errorText) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: const Color(0xFF667EEA)),
      errorText: errorText,
      filled: true,
      fillColor: const Color(0xFFF8FAFC),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF667EEA), width: 2)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
    );
  }
}