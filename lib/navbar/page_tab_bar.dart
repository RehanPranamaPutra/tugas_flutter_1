import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tugas1/navbar/page_grid_view.dart';
import 'package:flutter_tugas1/navbar/page_list_view.dart';
import 'package:flutter_tugas1/navbar/page_register.dart';


class PageTabBar extends StatefulWidget {
  const PageTabBar({super.key});

  @override
  State<PageTabBar> createState() => _PageTabBarState();
}

class _PageTabBarState extends State<PageTabBar>
    with SingleTickerProviderStateMixin {
  //inisialisasi object untuk tab

  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Bar', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 65, 78, 88),
      ),
      body: TabBarView(
        controller: tabController,
        children: [PageRegister(), PageGridView(), PageListView()],
      ),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          controller: tabController,
          tabs: [
            Tab(text: 'Register', icon: Icon(Icons.input)),
            Tab(text: 'Grid View', icon: Icon(Icons.grid_on)),
            Tab(text: 'List View', icon: Icon(Icons.list)),
          ],
        ),
      ),
    );
  }
}
