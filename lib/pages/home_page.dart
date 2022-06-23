import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_list_widget.dart';

import '../widgets/home_page_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const HomePageAppBarWidget(),
      body: AllTaskListWidget(),
    );
  }
}
