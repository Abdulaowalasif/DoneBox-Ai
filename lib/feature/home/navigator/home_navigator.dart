import 'package:doneboxai/feature/home/screens/action_screen.dart';
import 'package:doneboxai/feature/home/screens/home_screen.dart';
import 'package:doneboxai/feature/home/screens/new_event_screen.dart';
import 'package:doneboxai/feature/home/screens/new_note_screen.dart';
import 'package:doneboxai/feature/home/screens/new_task_screen.dart';
import 'package:doneboxai/routes/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/conts/navIds.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final canPop =
            Get.nestedKey(NavIds.home)?.currentState?.canPop() ?? false;
        if (canPop) {
          Get.nestedKey(NavIds.home)?.currentState?.pop();
          return false;
        }
        return true;
      },
      child: Navigator(
        key: Get.nestedKey(NavIds.home),
        initialRoute: RoutesName.home,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RoutesName.home:
              return MaterialPageRoute(builder: (_) => const HomeScreen());
            case RoutesName.newEvent:
              return MaterialPageRoute(builder: (_) => const NewEventScreen());
            case RoutesName.newTask:
              return MaterialPageRoute(builder: (_) => const NewTaskScreen());
            case RoutesName.newNote:
              return MaterialPageRoute(builder: (_) => const NewNoteScreen());
            case RoutesName.actions:
              return MaterialPageRoute(builder: (_) => const ActionScreen());
            default:
              return null;
          }
        },
      ),
    );
  }
}
