import 'package:aplikasi_saya/app/modules/FormPendaftaran/views/form_pendaftaran_view.dart';
import 'package:aplikasi_saya/app/modules/counter/views/counter_view.dart';
import 'package:aplikasi_saya/app/modules/home/controllers/home_controller.dart';
import 'package:aplikasi_saya/app/modules/kitab/views/kitab_view.dart';
import 'package:aplikasi_saya/app/modules/post/views/post_view.dart';
import 'package:aplikasi_saya/app/modules/profile/views/profile_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});

  final List<Widget> pages = [
    CounterView(),
    PostView(),
    FormPendaftaranView(),
    KitabView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.exposure, title: 'Counter'),
          TabItem(icon: Icons.send, title: 'Post'),
          TabItem(icon: Icons.edit_note, title: 'Form'),
          TabItem(icon: Icons.menu_book, title: 'Kitab'),
          TabItem(icon: Icons.verified_user, title: 'Profile'),
        ],
        initialActiveIndex: 0,
        onTap: controller.changePage,
      ),
    );
  }
}
