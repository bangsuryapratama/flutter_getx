import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';

class RegisterView extends StatelessWidget {
  final AuthController c = Get.find();

  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const Text(
                "Buat Akun Baru ✨",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.5,
                  color: Color(0xFF1E293B),
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "Daftar sekarang untuk melanjutkan",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF64748B),
                ),
              ),
              const SizedBox(height: 40),

              // Card Form
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: nameC,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person_outline),
                        labelText: "Nama Lengkap",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: emailC,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined),
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passC,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline),
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Obx(
                      () => c.isLoading.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              height: 52,
                              child: ElevatedButton(
                                onPressed: () => c.register(
                                  nameC.text.trim(),
                                  emailC.text.trim(),
                                  passC.text.trim(),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF10B981), Color(0xFF059669)],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "Daftar",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Back to Login
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun? "),
                  TextButton(
                    onPressed: () => Get.offAllNamed(Routes.LOGIN),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
