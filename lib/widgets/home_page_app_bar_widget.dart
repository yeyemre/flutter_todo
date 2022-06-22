import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:todo_app/constants/constant.dart';
import 'package:todo_app/constants/text_style_constant.dart';
import 'package:todo_app/controller/task_list_controller.dart';
import 'package:todo_app/models/task_model.dart';

class HomePageAppBarWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const HomePageAppBarWidget({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  State<HomePageAppBarWidget> createState() => _HomePageAppBarWidgetState();
}

class _HomePageAppBarWidgetState extends State<HomePageAppBarWidget> {
  var taskList = TaskListController.listTask;
  late TextEditingController controller;
  late FocusNode focusNode;
  String name = '';

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        Constant.appBarTitle,
        style: TextStyleConstant.appBarTextStyle,
      ),
      centerTitle: false,
      actions: _appBarActionButtons(context),
    );
  }

  List<Widget> _appBarActionButtons(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
          onPressed: () {
            debugPrint('SearchButton onPressed');
          },
          icon: const Icon(
            Icons.search,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: IconButton(
          onPressed: _addButtonTaskBottomSheet,
          icon: const Icon(
            Icons.add,
            color: Colors.black,
            size: 28,
          ),
        ),
      ),
    ];
  }

  void _addButtonTaskBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: MediaQuery.of(context).viewInsets,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                focusNode: focusNode,
                autofocus: true,
                decoration: const InputDecoration(
                    border: InputBorder.none, hintText: 'Görev Adını Girin...'),
                onSubmitted: _addTaskTextFieldOnSubmitted,
              ),
            ),
          );
        });
  }

  void _addTaskTextFieldOnSubmitted(String value) {
    if (value.length > 3) {
      controller.clear();
      Get.back();

      name = value;
      _showTimePicker();
    } else {
      Get.snackbar(
        "Uyarı",
        "Tanımlanan Görev Adı 3 Karakterden Az Olamaz!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
      );
      controller.clear();
      focusNode.requestFocus();
    }
  }

  void _showTimePicker() {
    DatePicker.showTimePicker(
      context,
      showTitleActions: true,
      showSecondsColumn: false,
      locale: LocaleType.tr,
      theme: const DatePickerTheme(
        backgroundColor: Colors.black38,
        itemStyle: TextStyle(
          color: Colors.white,
        ),
        cancelStyle: TextStyle(
          color: Colors.white,
        ),
        doneStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      currentTime: DateTime.now(),
      onConfirm: _showTimePickerOnConfirm,
    );
  }

  void _showTimePickerOnConfirm(DateTime time) {
    taskList.add(TaskModel.createInstance(
        name: name, createdDate: time, isCompleted: false));
    Get.snackbar(
      'Başarılı',
      'Görev Başarıyla Tanımlandı',
      backgroundColor: Colors.greenAccent,
    );
  }
}
