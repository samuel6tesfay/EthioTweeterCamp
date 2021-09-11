import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'thread/bloc_observer.dart';
import 'thread/blocs/blocs.dart';
import 'thread/data_providers/thread-data-provider.dart';
import 'thread/repository/thread-repository.dart';
import 'thread/screens/thread_route.dart';

// import 'thread/bloc_observer.dart';
import 'trend/blocs/blocs.dart';
import 'trend/data_providers/trend-data-provider.dart';
import 'trend/repository/trend-repository.dart';
import 'trend/screens/trend_route.dart';

import 'mostRelevantPeople/blocs/blocs.dart';
import 'mostRelevantPeople/data_providers/mostRelevantPeople-data-provider.dart';
import 'mostRelevantPeople/repository/mostRelevantPeople-repository.dart';
import 'mostRelevantPeople/screens/mostRelevantPeople_route.dart';

import 'auth/screens/login.dart';

import 'menu_item.dart';

// void main() {
//   Bloc.observer = SimpleBlocObserver();

//   final ThreadRepository threadRepository = ThreadRepository(ThreadDataProvider());

//   runApp(
//     ThreadApp(threadRepository: threadRepository),
//   );
// }

void main() {
  final ThreadRepository threadRepository =
      ThreadRepository(ThreadDataProvider());
  final TrendRepository trendRepository = TrendRepository(TrendDataProvider());
  final MostRelevantPeopleRepository mostRelevantPeopleRepository =
      MostRelevantPeopleRepository(MostRelevantPeopleDataProvider());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      HomePage.homeRoute: (context) => HomePage(),
      ThreadApp.threadRoute: (context) =>
          ThreadApp(threadRepository: threadRepository),
      TrendApp.trendRoute: (context) =>
          TrendApp(trendRepository: trendRepository),
      MostRelevantPeopleApp.mostRelevantPeopleRoute: (context) =>
          MostRelevantPeopleApp(
              mostRelevantPeopleRepository: mostRelevantPeopleRepository)
    },
  ));
}

class ThreadApp extends StatelessWidget {
  final ThreadRepository threadRepository;

  static const String threadRoute = '/thread';

  ThreadApp({required this.threadRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.threadRepository,
      child: BlocProvider(
        create: (context) => ThreadBloc(threadRepository: this.threadRepository)
          ..add(ThreadLoad()),
        child: MaterialApp(
          title: 'Thread App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: ThreadAppRoute.generateRoute,
        ),
      ),
    );
  }
}

class TrendApp extends StatelessWidget {
  final TrendRepository trendRepository;

  static const String trendRoute = '/trend';

  TrendApp({required this.trendRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.trendRepository,
      child: BlocProvider(
        create: (context) =>
            TrendBloc(trendRepository: this.trendRepository)..add(TrendLoad()),
        child: MaterialApp(
          title: 'Trend App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: TrendAppRoute.generateRoute,
        ),
      ),
    );
  }
}

class MostRelevantPeopleApp extends StatelessWidget {
  final MostRelevantPeopleRepository mostRelevantPeopleRepository;

  static const String mostRelevantPeopleRoute = '/mostRelevantPeople';

  MostRelevantPeopleApp({required this.mostRelevantPeopleRepository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: this.mostRelevantPeopleRepository,
      child: BlocProvider(
        create: (context) => MostRelevantPeopleBloc(
            mostRelevantPeopleRepository: this.mostRelevantPeopleRepository)
          ..add(MostRelevantPeopleLoad()),
        child: MaterialApp(
          title: 'MostRelevantPeople App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: MostRelevantPeopleAppRoute.generateRoute,
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ThreadRepository threadRepository =
      ThreadRepository(ThreadDataProvider());

  static const String homeRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.notification_important),
          )
        ],
      ),
      drawer: Drawer(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                color: const Color(0xFF262AAA),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Text(
                        "samuel",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "samuel6tesfay@gmail.com",
                        style: TextStyle(
                          color: Color(0xFF1BB5FD),
                          fontSize: 15,
                        ),
                      ),
                      leading: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                        icon: Icons.threed_rotation_rounded,
                        title: "Thread",
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ThreadApp.threadRoute);
                        }),
                    MenuItem(
                      icon: Icons.trending_flat_rounded,
                      title: "Trend",
                      onTap: () {
                        Navigator.of(context).pushNamed(TrendApp.trendRoute);
                      },
                    ),
                    MenuItem(
                      icon: Icons.people,
                      title: "Most Relevant People",
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            MostRelevantPeopleApp.mostRelevantPeopleRoute);
                      },
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Colors.white.withOpacity(0.3),
                      indent: 32,
                      endIndent: 32,
                    ),
                    MenuItem(
                      icon: Icons.settings,
                      title: "Settings",
                      onTap: () {},
                    ),
                    MenuItem(
                      icon: Icons.exit_to_app,
                      title: "Logout",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.9),
              child: GestureDetector(
                onTap: () {},
                child: ClipPath(
                  clipper: CustomMenuClipper(),
                  child: Container(
                    width: 35,
                    height: 110,
                    color: Color(0xFF262AAA),
                    alignment: Alignment.centerLeft,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: LoginPage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ThreadApp(threadRepository: threadRepository);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class StackWidget extends StatelessWidget {
  Widget stack1 = Stack(
    alignment: Alignment(0.6, 0.6),
    children: [
      CircleAvatar(
        // backgroundImage: AssetImage('lib/assets/image.png'),
        radius: 100,
      ),
      Container(
        width: 50,
        height: 20,
        decoration: BoxDecoration(color: Colors.white),
        child: Text(
          'Mia B',
          style: TextStyle(
              // fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      // ElevatedButton(
      //   child: Text("Goto MyApp Page"),
      //   onPressed: (){
      //     // Navigator.of(context).pushNamed(MyApp.myappRoute);
      //   },
      // ),
    ],
  );

  Widget stack2 = Stack(
    // alignment: Alignment(0.6 , 0.6),
    children: <Widget>[
      Positioned(
        child: Container(
          width: 150,
          height: 150,
          color: Colors.green[300],
          child: Text(
            'Green',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // stack1,
          stack2
        ],
      ),
    );
  }
}
