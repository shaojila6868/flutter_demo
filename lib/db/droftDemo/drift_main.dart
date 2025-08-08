import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/db/droftDemo/appDatabase.dart';
import 'package:flutter_demo/db/droftDemo/todo_viewmodel.dart';
import 'package:provider/provider.dart';
import 'appDatabase.dart';

/**
 * MVVM 방식으로 DB를 사용한다.
 *
 * drift DB 라이브러리 사용하였고
 * Riverpod 라이브러리로 Stream(LiveData)을 실현하였다
 */

void main() {
  final db = AppDatabase();
  runApp(
    MultiProvider(providers: [
      Provider(create: (_) => db),
      ChangeNotifierProvider(create: (context) => TodoVieModel(db))
    ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: TodoScreen(),
    );
  }
}

class TodoScreen extends StatefulWidget {
  const TodoScreen({ super.key});

  @override
  State<StatefulWidget> createState() => _TodoScreenState();

}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<TodoVieModel>();

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('할 일 관리'),
        ),
        child: SafeArea(
            child: Column(
              children: [
                CupertinoTextField(
                  controller: _controller,
                  placeholder: '할 일을 입력하세요',
                  onSubmitted: (value) {
                    if(value.trim().isNotEmpty) {
                      vm.addTodo(value.trim());
                      // vm.getTodos();
                      // vm.notifyListeners();
                      _controller.clear();
                    }
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                    child: StreamBuilder<List<Todo>>(
                        stream: vm.todos,
                        builder: (context, snapshot) {
                          if(!snapshot.hasData) {
                            return const Center(child: CupertinoActivityIndicator());
                          }
                          final todos = snapshot.data!;
                          return ListView.builder(
                            itemCount: todos.length,
                              itemBuilder: (context, index) {
                                final todo = todos[index];
                                return CupertinoListTile(
                                    title: Text(todo.title),
                                    trailing: CupertinoSwitch(
                                        value: todo.completed,
                                        onChanged: (_) => vm.toggleTodo(todo)));
                              });
                        })


                  // child: FutureBuilder<List<Todo>>(
                  //     future: vm.getTodos(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.connectionState == ConnectionState.waiting) {
                  //         return Center(child: CircularProgressIndicator()); // 로딩중
                  //       } else if (snapshot.hasError) {
                  //         return Center(child: Text('에러: ${snapshot.error}'));
                  //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  //         return Center(child: Text('할 일이 없습니다.'));
                  //       }
                  //
                  //       final todos = snapshot.data!;
                  //       return ListView.builder(
                  //           itemCount: todos.length,
                  //           itemBuilder: (context, index) {
                  //             final todo = todos[index];
                  //             return CupertinoListTile(
                  //                 title: Text(todo.title),
                  //                 trailing: CupertinoSwitch(
                  //                     value: todo.completed,
                  //                     onChanged: (_) => vm.toggleTodo(todo)));
                  //           });
                  //     }),

                ),
              ],
            )
        ));
  }


}
