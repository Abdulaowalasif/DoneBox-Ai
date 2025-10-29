import 'dart:io';

import 'package:doneboxai/feature/auth/widgets/custom_button.dart';
import 'package:doneboxai/feature/home/controllers/task_details_controller.dart';
import 'package:doneboxai/feature/widgets/custom_appbar.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/app_colors.dart';
import '../../../core/conts/my_text_style.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskDetailsController controller = Get.find();
    return Obx(
      () => Scaffold(
        appBar: CustomAppbar(
          title: 'Task Details',
          onPress: () {
            Get.toNamed(RoutesName.editTask);
          },
          trailing: Icons.edit_outlined,
        ),
        body: controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 20,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors.primaryColor,
                            width: 1,
                          ),
                          color: AppColors.secondaryColor,
                        ),
                        child: Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Text(
                                controller.details['title'] ?? 'Task Details',
                                style: MyTextStyle.w5s20(context),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Category"),
                                Obx(
                                  () => Text(
                                    controller.details['category']['title'] ??
                                        'Work',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Due Date"),
                                Obx(() {
                                  String? dateTime =
                                      controller.details['ends_at'];

                                  // Handle null safely
                                  if (dateTime == null ||
                                      !dateTime.contains('T')) {
                                    return Text("01-01-2025");
                                  }

                                  // Extract date part (before 'T')
                                  String date = dateTime.split('T')[0];

                                  return Text(date);
                                }),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Time"),
                                Obx(() {
                                  String? dateTime =
                                      controller.details['ends_at'];

                                  // Handle null safely
                                  if (dateTime == null ||
                                      !dateTime.contains('T')) {
                                    return Text("00:00 AM");
                                  }

                                  // Extract time part
                                  String time = dateTime
                                      .split('T')[1]
                                      .replaceAll('Z', '');

                                  return Text(time);
                                }),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Notification"),
                                Obx(
                                  () => Switch(
                                    value:
                                        controller.details['notify'] ?? false,
                                    onChanged: (val) {},
                                    activeTrackColor: AppColors.primaryColor,
                                    inactiveThumbColor: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Reminder"),
                                Obx(
                                  () => Text(
                                    controller.details['reminder_interval'] ??
                                        "Weekly",
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtasks", style: MyTextStyle.w5s20(context)),
                          // TextButton(
                          //   onPressed: () {
                          //     showDialog(
                          //       context: context,
                          //       builder: (ctx) {
                          //         final TextEditingController subtaskController =
                          //             TextEditingController();
                          //         return Dialog(
                          //           insetPadding: EdgeInsets.all(20),
                          //           // removes default margin
                          //           child: Container(
                          //             width: MediaQuery.of(
                          //               context,
                          //             ).size.width, // full screen width
                          //             padding: const EdgeInsets.all(20),
                          //             child: Column(
                          //               mainAxisSize: MainAxisSize.min,
                          //               children: [
                          //                 Text(
                          //                   "Add Subtask",
                          //                   style: MyTextStyle.w5s20(
                          //                     ctx,
                          //                   ).copyWith(color: AppColors.primaryColor),
                          //                 ),
                          //                 const SizedBox(height: 20),
                          //                 TextField(
                          //                   controller: subtaskController,
                          //                   decoration: InputDecoration(
                          //                     hintText: "Enter subtask",
                          //                     hintStyle: MyTextStyle.w4s16(context),
                          //                     border: OutlineInputBorder(),
                          //                   ),
                          //                 ),
                          //                 const SizedBox(height: 20),
                          //                 Row(
                          //                   mainAxisAlignment: MainAxisAlignment.end,
                          //                   children: [
                          //                     TextButton(
                          //                       onPressed: () => Navigator.pop(ctx),
                          //                       child: Text(
                          //                         "Cancel",
                          //                         style: MyTextStyle.w4s16(ctx),
                          //                       ),
                          //                     ),
                          //                     CustomButton(
                          //                       text: "Add",
                          //                       onPressed: () {
                          //                         if (subtaskController
                          //                             .text
                          //                             .isNotEmpty) {
                          //                           controller.addSubTask(
                          //                             subtaskController.text,
                          //                           );
                          //                         }
                          //                         Navigator.pop(ctx);
                          //                       },
                          //                       width: 100,
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   },
                          //   child: Text(
                          //     "+ Add SubTask",
                          //     style: MyTextStyle.w5s20(
                          //       context,
                          //     ).copyWith(color: AppColors.primaryColor),
                          //   ),
                          // ),
                        ],
                      ),
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.subTasks.length,
                          itemBuilder: (context, index) {
                            final subTask = controller.subTasks[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                child: Text(
                                  (index + 1).toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              title: Text(subTask["title"] ?? "No tasks"),
                            );
                          },
                        ),
                      ),

                      /// Attachments
                      Text("Attachments", style: MyTextStyle.w5s20(context)),

                      Obx(() {
                        final attachments =
                            controller.details['attachments'] ?? [];

                        if (attachments.isEmpty) {
                          return const Center(
                            child: Text(
                              'No attachments found',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }

                        return Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: attachments.asMap().entries.map((entry) {
                            final index = entry.key;
                            final attachment = entry.value;

                            // Handle both local files and remote URLs
                            final isLocalFile = attachment is File;
                            final fileName = isLocalFile
                                ? attachment.path.split('/').last
                                : (attachment['file']?.split('/')?.last ??
                                      'Unknown');

                            final fileUrl = isLocalFile
                                ? null
                                : attachment['file'];

                            // Detect image type
                            final isImage =
                                fileName.endsWith('.png') ||
                                fileName.endsWith('.jpg') ||
                                fileName.endsWith('.jpeg') ||
                                fileName.endsWith('.gif');

                            return Container(
                              width: 120,
                              height: 120,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (isLocalFile && isImage)
                                          Image.file(
                                            attachment,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                          )
                                        else if (!isLocalFile && isImage)
                                          Image.network(
                                            fileUrl!,
                                            width: 60,
                                            height: 60,
                                            fit: BoxFit.cover,
                                            errorBuilder: (_, __, ___) =>
                                                const Icon(
                                                  Icons.broken_image,
                                                  size: 30,
                                                  color: Colors.redAccent,
                                                ),
                                          )
                                        else
                                          const Icon(
                                            Icons.insert_drive_file,
                                            color: Colors.blue,
                                            size: 40,
                                          ),
                                        const SizedBox(height: 4),
                                        Text(
                                          fileName,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      }),

                      CustomButton(
                        text: "Mark as Completed",
                        onPressed: () {
                          Get.back();
                        },
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
