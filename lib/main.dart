import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Title aaaaa a   ',
              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
            backgroundColor: Colors.blue,
            centerTitle: false,
          ),
          body: body()),
    ),
  ));
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
              {
                context.read<CounterBloc>().add(new CouterIncrement())
              },
            ),

          ),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16)
          ),


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
              children: [BodyItem(), BodyItem(), BodyItem(), BodyItem()],

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
                      child: Text("+"),
                      onPressed: () =>
                      {
                        context.read<CounterBloc>()
                      },
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
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

                ],
              ),
            )
          ],

        )

    );
  }
}

