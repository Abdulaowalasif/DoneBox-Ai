
import 'package:flutter/material.dart';

import '../../../core/conts/app_colors.dart';

class HomeMeetingCard extends StatelessWidget {
  const HomeMeetingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 10; i++)  Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              style: ListTileStyle.drawer,
              title: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor:
                        AppColors.primaryColor,
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Meeting",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "10:00 AM",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Row(
                      spacing: 10,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(10),
                            color: Color(0xFF72B34A),
                          ),
                        ),
                        Text(
                          "Work",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: Text(
                      "High",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
