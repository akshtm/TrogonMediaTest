import 'dart:developer';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:machinetest/Model/Categories.dart';
import 'package:machinetest/Model/Topcourses.dart';
import 'package:machinetest/ViewModel/Viewmodel.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List colors = [Colors.blue, Colors.red, Colors.green];
  Random random = new Random();
  int initCol = 0;

  int index = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final vm = Provider.of<Viewmodel>(context, listen: false);
      vm.GetViewTopCourses();
      vm.GetViewCategories();
    });
  }

  Widget build(BuildContext context) {
    final vm = Provider.of<Viewmodel>(context, listen: false);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 400, top: 10),
              child: SizedBox(
                  height: 60,
                  width: 50,
                  child: Image.asset('assets/images/futursitylogo.png')),
            ),
          ],
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          //Top courses
          Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '  Top Course',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'All Courses >',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              Consumer<Viewmodel>(
                builder: (context, vm1, child) {
                  return SizedBox(
                    height: 300,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: vm1.TopCourses.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          Topcourses topcousre = vm1.TopCourses[index];
                          return Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 130,
                                  width: 200,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      borderRadius: BorderRadius.all(
                                          Radius.elliptical(10, 10)),
                                      image: DecorationImage(
                                          image:
                                              NetworkImage(topcousre.thumbnail),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 10, 0, 5),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      topcousre.title,
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 50, 2, 19),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      topcousre.fullPrice + "INR +GST",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.grey),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            height: 0,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          );
                        }),
                  );
                },
              ),
            ]),
          ),

          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
          ),

          //categories
          Expanded(child: Consumer<Viewmodel>(
            builder: (context, vm2, child) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  itemCount: vm2.Categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 20.0),
                  itemBuilder: (BuildContext context, int index) {
                    Categories category = vm2.Categories[index];
                    initCol = random.nextInt(3);

                    return Container(
                      decoration: BoxDecoration(
                          color: colors[initCol],
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10))),
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            width: 240,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius:
                                    BorderRadius.all(Radius.elliptical(10, 10)),
                                image: DecorationImage(
                                    image: NetworkImage(category.thumbnail),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 220,
                            child: Column(
                              children: [
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  category.name,
                                  style: GoogleFonts.rubik(
                                      fontSize: 17, color: Colors.white),
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      " " +
                                          category.numberOfCourses.toString() +
                                          " Courses",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ))
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ))
        ],
      )),
    );
  }
}
