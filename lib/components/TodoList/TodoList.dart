import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  static final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final ScrollController listController = ScrollController();

  List<String> entries = <String>['A', 'B', 'C', 'A', 'B', 'C', 'A', 'B', 'C'];
  bool loading = false;

  Future<void> _refresh() async {
    return Future<void>.delayed(const Duration(seconds: 3), () {
      setState(() {
        entries = <String>['A', 'B', 'C'];
      });
    });
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < entries.length) {
      return Container(
        height: 150,
        color: Colors.white,
        child: Center(child: Text('Entry ${entries[index]}')),
      );
    }
    return Container(
      height: 50,
      child: const Center(
        child:Text('加载中...'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    listController.addListener(() {
      if (listController.position.pixels ==
          listController.position.maxScrollExtent) {
        print('滑动到了最底部');
        setState(() {
          entries.addAll(<String>["D"]);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TodoList'),
        toolbarHeight: 42,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: RefreshIndicator(
        key: refreshIndicatorKey,
        strokeWidth: 1.0,
        onRefresh: _refresh,
        child: entries.isNotEmpty
            ? ListView.separated(
                controller: listController,
                itemCount: entries.length + 1, // 加载更多
                itemBuilder: _itemBuilder,
                padding: const EdgeInsets.all(2),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 5.0,
                    color: Colors.transparent,
                  );
                },
              )
            : const Center(child: Text('No items')),
      ),
    );
  }
}
