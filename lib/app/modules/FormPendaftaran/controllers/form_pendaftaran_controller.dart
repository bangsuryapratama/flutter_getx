// import 'dart:ffi';

import 'package:aplikasi_saya/app/modules/FormPendaftaran/views/results_screen_view.dart';
import 'package:get/get.dart';

class FormPendaftaranController extends GetxController {
  
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateofBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  RxString namaError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateofBirthError = ''.obs;
  RxString phoneError = ''.obs;


  //fungsi validasi
  void validateName({required String name}) {
  if (name.length < 3) {
    namaError.value = 'Nama harus minimal 3 karakter';
  } else if(name.length > 6){
    namaError.value = 'Nama harus maximal 6 karakter';
  } else {
    namaError.value = '';
  }
}

  void validateGender({required String? jenisKelamin}) {
  if (jenisKelamin == null || jenisKelamin.isEmpty) {
    genderError.value = 'Pilih Jenis Kelamin!';
  } else {
    genderError.value = '';
  }
}

  void validateDateOfBirth({required DateTime? tanggalLahir}) {
  if (tanggalLahir == null) {
    dateofBirthError.value = 'Pilih Tanggal Lahir!';
  } else {
    final now = DateTime.now();
    final age = now.year - tanggalLahir.year;
    if ( age <= 2) {
        dateofBirthError.value = 'Umur Minimal 2 Tahun';
    } else {
    dateofBirthError.value = '';
    }
  }
}

  void validatePhone({required String phone}){
  if (!GetUtils.isPhoneNumber(phone)) {
    phoneError.value = 'Nomor Telepon Tidak Valid';
  } else {
    phoneError.value = '';
  }
 }


  void submitForm(){
    validateName(name: name.value);
    validateGender(jenisKelamin: gender.value);
    validateDateOfBirth(tanggalLahir: dateofBirth.value);
    validatePhone(phone: phone.value);

    if (namaError.value.isEmpty
          && genderError.value.isEmpty
          && dateofBirthError.isEmpty
          && phoneError.isEmpty ) {
            Get.to(
              () => ResultsScreenView(
                  name: name.value,
                  gender : gender.value,
                  dateOfBirth : dateofBirth.value!,
                  phone : phone.value,
              ),
            );
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
