import 'package:doneboxai/core/conts/image_icon_const.dart';
import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Profile", onPress: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(ImageConst.user),
                    ),
                    Positioned(
                      bottom: -10,
                      right: -10,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit_outlined, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Itunuoluwa Abidoye",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextField(
                decoration: InputDecoration(
                  hint: Text(
                    "Itunuoluwa Abidoye",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Text(
                "Your Emaill",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextField(
                decoration: InputDecoration(
                  hint: Text(
                    "Itunuoluwa@gmail.com",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Text(
                "Phone",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hint: Text(
                    "+ 254 00555856",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Text(
                "Location",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  hint: Text(
                    "Dhaka, Bangladesh",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: "Edit Profile",
                onPressed: () {
                  Get.back();
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
