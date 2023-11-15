import 'package:flutter/material.dart';
import 'app_styles.dart';
import 'size_config.dart';
import '../sidebar/car-owner_sidebar_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: tCharcoal),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: tCharcoal,
            title: Text(
              'Sidebar',
              style: tInterRegular.copyWith(
                color: Colors.white,
                fontSize: SizeConfig.blockSizeHorizontal! * 5,
              ),
            ),
            // actions: [
            //   Container(
            //     margin: EdgeInsets.all(8.0),
            //     decoration: BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(16.0),
            //     ),
            //     child: Builder(
            //       builder: (builderContext) => IconButton(
            //         icon: Icon(
            //           Icons.menu,
            //           color: Color(0xff273E47),
            //         ),
            //         onPressed: () {
            //           Scaffold.of(builderContext).openEndDrawer();
            //         },
            //       ),
            //     ),
            //   ),
            // ],
            iconTheme: IconThemeData(color: tWhite)),
        body: Center(
          child: Text('Main Body'),
        ),
        endDrawer: CarOwnerSidebarCard());
  }
}
