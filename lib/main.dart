import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'counter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('${bloc.runtimeType} $error $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('${bloc.runtimeType} $transition');
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CounterBloc(),
      ),
      // BlocProvider(
      //   create: (context) => SubjectBloc(),
      // ),SubjectBloc
    ],
    child: MaterialApp(
      title: "First app by duynd",
      home: Page(),
    ),
  ));
}

class Page extends StatelessWidget {
  const Page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: ListView(
        children: [
          DrawerHeader(child: Text("Header")),
          ListTile(
            title: Text("Menu item"),
            trailing: Icon(Icons.navigate_next),
          )
        ],
      )),
        appBar: AppBar(
          title: Text(
            'Title app',
            // maxLines: 1,
            // overflow: TextOverflow.ellipsis,
          ),
          backgroundColor: Colors.blue,
          centerTitle: false,
          
          actions: [
            IconButton(onPressed: () {}, icon: Icon(
              Icons.settings, color: Colors.white,
            )),
            PopupMenuButton(
              icon: Icon(Icons.share),
              color: Colors.white,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(child: Icon(Icons.facebook)),
                  PopupMenuItem(child: Icon(Icons.mail)),
                ];
              },
            )
          ],
          leading: LeadingAppbar(),
          
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add),),
        body: body());
  }
}

class LeadingAppbar extends StatelessWidget {
  const LeadingAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      print("object");
      Scaffold.of(context).openDrawer();
    }, icon: Icon(Icons.menu, color: Colors.white,));
  }
}

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        print(state);
        return Center(
            child: Container(
          width: double.infinity,
          height: double.infinity,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: BodyContent(),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey,
                width: 10,
                style: BorderStyle.solid,
                strokeAlign: BorderSide.strokeAlignInside),
            color: Colors.green,
            // shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.pink,
                offset: Offset(8, 8),
                blurRadius: 10,
              )
            ],

            // borderRadius: BorderRadius.circular(16)
          ),
          // transform: Matrix4.rotationZ(30),
        ));
      },
    );
  }
}

class BodyItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        return Container(
          width: 50,
          height: 50,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: OutlinedButton(
              child: Text("$state"),
              onPressed: () =>
                  {context.read<CounterBloc>().add(new CouterIncrement())},
            ),
          ),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(16)),
        );
      },
    );
  }
}

class BodyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              // textDirection: TextDirection.rtl,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // mainAxisSize: MainAxisSize.min,
              children: [
                BodyItem(),
                BodyItem(),
                OutlinedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          backgroundColor: Colors.red,
                          enableDrag: true,
                          // isScrollControlled: true,
                          scrollControlDisabledMaxHeightRatio: .9,
                          // barrierColor: Colors.grey,
                          builder: (context) {
                            return Container(
                              width: double.infinity,
                              child: const Column(
                                children: [
                                  Text("He;;p"),
                                  Text("He;;p"),
                                  Text("He;;p"),
                                  Text("He;;p"),
                                  Text("He;;p"),
                                  Text("He;;p"),
                                  Text("He;;p"),
                                  Text("He;;p"),
                                  Text("He;;p"),
                                ],
                              ),
                            );
                          });
                    },
                    child: Text("BtmSheet")),
                OutlinedButton(
                    onPressed: () async {
                      DateTime? date = await showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 14)));
                      print("Date selected $date");
                    },
                    child: Text("Date"))
              ],
            ),
            Container(
              width: 400,
              height: 400,
              color: Colors.grey,
              child: Stack(
                // alignment: Alignment.center,
                fit: StackFit.loose,

                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 200,
                    height: 200,
                    color: Colors.red,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    child: OutlinedButton(
                      child: Text("Show dialog"),
                      onPressed: () => {
                        showDialog(
                            context: context,
                            barrierColor: Colors.red,
                            builder: (context) => AlertDialog(
                                  title: Text("Title"),
                                  content: Text("content"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          TextButton(
                                              onPressed: () {},
                                              child: Text("Cancel"));
                                        },
                                        child: Text("Cancel")),
                                    TextButton(
                                        onPressed: () {}, child: Text("OK"))
                                  ],
                                  alignment: Alignment.topCenter,
                                  shadowColor: Colors.yellow,
                                  elevation: 16,
                                ))
                      },
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue, shape: BoxShape.circle),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 40,
                      height: 700,
                      color: Colors.yellow,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    width: 40,
                    height: 40,
                    child: Container(
                      color: Colors.pink,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    width: 180,
                    height: 180,
                    child: Container(
                      color: Colors.pink,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/tho.jpeg',
                            fit: BoxFit.cover,
                            width: 150,
                          ),
                          SvgPicture.asset('assets/images/checkin.svg')
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ));
  }
}
