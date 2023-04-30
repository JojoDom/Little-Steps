import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:little_steps/controllers/students_controller.dart';
import 'package:little_steps/controllers/teachers_controller.dart';
import 'package:little_steps/screens/home/local_widgets/students_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AllTeachers extends StatefulWidget {
  const AllTeachers({Key? key}) : super(key: key);

  @override
  State<AllTeachers> createState() => _AllTeachersState();
}

class _AllTeachersState extends State<AllTeachers> {
  final teacherController = Get.put(TeachersController());
  final TextEditingController searchController = TextEditingController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  void initState() {
    super.initState();
  }

  bool _isVisible = true;

  void switchIcon() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void _onRefresh() async {
    await teacherController.getTeachers(teacherCode: null);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F4F7),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: (()=> Get.back()), icon: const Icon(Icons.arrow_back_ios),color: Colors.red,),
        title: Text(
          'All Teachers',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Obx(
        () => Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: searchController,
                  decoration: InputDecoration(
                    suffixIcon: Visibility(
                      visible: _isVisible,
                      replacement: IconButton(
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              _isVisible = true;
                            });
                            teacherController.getTeachers(teacherCode: null);
                          },
                          icon: const Icon(Icons.close)),
                      child: IconButton(
                          onPressed: () async {
                            switchIcon();
                            await teacherController.getTeachers(
                                teacherCode: searchController.value.text);
                          },
                          icon: const Icon(Icons.search)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: Color(0xFFE7979C),
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        )),
                    hintText: 'Enter Teacher code',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 12),
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
            ],
          ),
          teacherController.isLoadingTeachers.isFalse
              ? Obx(
                  () => Expanded(
                    child: SmartRefresher(
                      controller: _refreshController,
                      enablePullDown: true,
                      enablePullUp: false,
                      header: const WaterDropHeader(),
                      onRefresh: _onRefresh,
                      child: ListView.separated(
                          physics: const AlwaysScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => StudentsListItem(
                              student: teacherController.teachers[index]),
                          separatorBuilder: (context, index) => Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: const SizedBox(height: 10,)
                          ),
                          itemCount: teacherController.teachers.length),
                    ),
                  ),
                )
              : const Center(
                  child: LinearProgressIndicator(
                    color: Colors.green,
                  ),
                )
        ]),
      ),
    );
  }
}