import 'package:flutter/material.dart';
import 'package:run/Foods.dart';
import 'package:run/modal/list.dart';
import 'package:run/shimmerwidget.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FoodList> fruits = [];

  bool isloading = false;
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future loadData() async {
    setState(() {
      isloading = true;
    });
    await Future.delayed(Duration(seconds: 5), () {});
    fruits = List.of(foods);

    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: isloading ? 5 : fruits.length,
          itemBuilder: (context, index) {
            if (isloading) {
              return buildFoodShimmer();
            } else {
              final data = fruits[index];
              return foodlist(data);
            }
          }),
    );
  }

  Widget foodlist(FoodList datas) => ListTile(
        leading: CircleAvatar(
          radius: 34,
          backgroundImage: NetworkImage(datas.imgURL),
        ),
        title: Text(
          datas.prodName,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          datas.desc,
          style: TextStyle(
            fontSize: 15,
          ),
          maxLines: 1,
        ),
      );

  Widget buildFoodShimmer() => ListTile(
        leading: ShimmerWidget.circular(height: 64, width: 64),
        title: Align(
            alignment: Alignment.centerLeft,
            child: ShimmerWidget.rectangular(
                width: MediaQuery.of(context).size.width * 0.3, height: 15)),
        subtitle: ShimmerWidget.rectangular(height: 14),
      );
}
