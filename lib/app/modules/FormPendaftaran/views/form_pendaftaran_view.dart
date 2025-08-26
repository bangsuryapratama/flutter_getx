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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Form Pendaftaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 3,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Input Nama
            Obx(
              () => buildInputCard(
                child: TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    prefixIcon: const Icon(Icons.person),
                    errorText: controller.namaError.value.isNotEmpty
                        ? controller.namaError.value
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Dropdown Gender
            Obx(
              () => buildInputCard(
                child: DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: const Text('Pilih Jenis Kelamin'),
                  items: ['Laki-laki', 'Perempuan']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                    controller.validateGender(jenisKelamin: value ?? '');
                  },
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.people),
                    errorText: controller.genderError.value.isNotEmpty
                        ? controller.genderError.value
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Date Picker
            Obx(
              () => buildInputCard(
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  leading: const Icon(Icons.cake, color: Colors.indigo),
                  title: Text(
                    controller.dateofBirth.value == null
                        ? 'Pilih Tanggal Lahir'
                        : DateFormat('dd-MM-yyyy')
                            .format(controller.dateofBirth.value!),
                    style: TextStyle(
                      fontSize: 16,
                      color: controller.dateofBirth.value == null
                          ? Colors.grey
                          : Colors.black87,
                    ),
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (selectedDate != null) {
                      controller.dateofBirth.value = selectedDate;
                      controller.validateDateOfBirth(tanggalLahir: selectedDate);
                    }
                  },
                  subtitle: controller.dateofBirthError.value.isNotEmpty
                      ? Text(
                          controller.dateofBirthError.value,
                          style: const TextStyle(color: Colors.red),
                        )
                      : null,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Input Telepon
            Obx(
              () => buildInputCard(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatePhone(phone: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    prefixIcon: const Icon(Icons.phone),
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Submit
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.submitForm(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'KIRIM',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper Widget untuk Card Input
  Widget buildInputCard({required Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      elevation: 3,
      shadowColor: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
