import 'dart:async';
import 'package:app1/page/Profile.dart';
import 'package:flutter/material.dart';

import '../helper/constant.dart';
import '../helper/lists.dart';
import '../widgets/text_widget.dart';
import 'Chat.dart';
import 'home.page.dart';

class SeeAll extends StatefulWidget {
  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  var opacity = 0.0;
  bool position = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      animator();
    });
  }

  animator() {
    if (opacity == 1) {
      opacity = 0;
      position = false;
    } else {
      opacity = 1;
      position = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: TextWidget("Our Doctors", 25, Colors.black, FontWeight.bold),
        backgroundColor: Colors.transparent,
        elevation: -0,
        leading: InkWell(
          onTap: () {
            animator();
            Timer(const Duration(milliseconds: 600), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            });
          },
          child: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
            size: 25,
          ),
        ),

      ),
      body: Column(
        children: [

          Expanded(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: opacity,
              child: Container(
                height: double.infinity,
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () async {
                      animator();
                      await Future.delayed(const Duration(milliseconds: 500));
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profile(
                            image: images[index],
                            name: names[index],
                            speciality: spacilality[index], biography: '',
                          ),
                        ),
                      );
                      animator();
                    },
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const SizedBox(width: 20,),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: images[index],
                              backgroundColor: Constant().primaryColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextWidget(
                                  names[index],
                                  20,
                                  Colors.black,
                                  FontWeight.bold,
                                  letterSpace: 0,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextWidget(
                                  spacilality[index],
                                  17,
                                  Colors.black,
                                  FontWeight.bold,
                                  letterSpace: 0,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(Icons.chat, color: Colors.lightGreen,),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Chat(
                                      image: images[index],
                                      name: names[index],
                                      specialist: spacilality[index], biography: '',
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 20,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
