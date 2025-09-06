
import 'package:flutter/material.dart';

import '../../../core/conts/image_icon_const.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      // responsive height
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF46B8EA),
            Color(0xFF30A3E4),
            Color(0xFF1378D4),
            Color(0xFF085CBE),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Good Morning, Hakim",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          const Text(
            "Today’s progress summary",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const Text(
            "5 Tasks",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
                child: Stack(
                  children: [
                    Image.asset(
                      ImageConst.user,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      left: 30,
                      top: 0,
                      child: Image.asset(
                        ImageConst.user,

                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 60,
                      top: 0,
                      child: Image.asset(
                        ImageConst.user,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 90,
                      top: 0,
                      child: Image.asset(
                        ImageConst.addUser, // replace with ImageConst.addUser
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Progress",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "40%",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: const LinearProgressIndicator(
                      minHeight: 10,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      value: 0.4,
                      color: Color(0xFF9397EF),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
