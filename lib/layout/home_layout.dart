import 'package:ahmed/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:ahmed/modules/done_tasks/done_tasks_screen.dart';
import 'package:ahmed/modules/new_tasks/new_tasks_screen.dart';
import 'package:ahmed/shared/components/constants.dart';
import 'package:ahmed/shared/cubit/cubit.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../shared/cubit/states.dart';

class  HomeLayout extends StatelessWidget  {

  var  scaffoldKey = GlobalKey<ScaffoldState>();
  var  formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var   dateController = TextEditingController();
  late Function onTap;



  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state){
          if(state is AppInsertDatabaseStates)
            {
              Navigator.pop(context);
            }
        },
        builder: (BuildContext context, AppStates state)
        {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key:scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDataDatabaseLoadingStates,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if(cubit.isBottomSheetShown)
                {
                  if(formKey.currentState!.validate())
                  {
                    cubit.insertToDatabase(title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);

                  }
                } else
                {
                  scaffoldKey.currentState?.showBottomSheet(
                        (context) => Container(
                      color: Colors.white,
                      padding: EdgeInsets.all(20.0,),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key : formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                            [
                              TextFormField(
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                validator: (value)
                                {
                                  if(value!.isEmpty){
                                    return 'title must not be empty';
                                  }else
                                  {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Tasks Title',
                                  prefixIcon: Icon(
                                    Icons.title,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: timeController,
                                keyboardType: TextInputType.datetime,
                                onTap: ()
                                {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value)
                                  {
                                    timeController.text = value!.format(context).toString();
                                    print(value!.format(context));
                                  });
                                },
                                validator: (value)
                                {
                                  if(value!.isEmpty){
                                    return 'time must not be empty';
                                  }else
                                  {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Tasks Time',
                                  prefixIcon: Icon(
                                    Icons.watch_later_outlined,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                onTap: ()
                                {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2023-05-03'),
                                  ).then((value)
                                  {
                                    dateController.text=DateFormat.yMMMd().format(value!);
                                  });
                                },
                                validator: (value)
                                {
                                  if(value!.isEmpty){
                                    return 'date must not be empty';
                                  }else
                                  {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  labelText: 'Tasks Date',
                                  prefixIcon: Icon(
                                    Icons.calendar_today,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value)
                  {
                    cubit.changeBottomSheetState(isShow: false, icon: Icons.edit);
                  }
                  );
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add,);

                }
              },
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.changeIndex(index);
                },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /*Future<String> getName() async
  {
    return 'Ahmed Mahran';
  }*/

  /*void createDatabase() async
  {
    database = await openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async
      {
        print('database created');
        await database.execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT,time TEXT,status TEXT)');
      },
      onOpen: (database) {

        getDataFromDatabase(database).then((value)
        {
         *//* setState(() {
            tasks = value;
          });*//*
        });

        print('database opened');
      },
    );
  }

  Future insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    return await database.transaction((txn)
    async {
      txn.rawInsert('INSERT INTO tasks(title, date, time, status) values("$title","$date","$time","new")',
      ).then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
      return database;
    });
  }

  Future<List<Map>> getDataFromDatabase(database)async
  {
    return await database.rawQuery('SELECT * FROM tasks');
  }*/
}



