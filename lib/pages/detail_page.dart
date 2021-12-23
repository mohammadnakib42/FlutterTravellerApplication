import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:traveller/cubit/app_cubit_states.dart';
import 'package:traveller/cubit/app_cubits.dart';
import 'package:traveller/widgets/app_button.dart';
import 'package:traveller/widgets/app_large_text.dart';
import 'package:traveller/widgets/app_text.dart';
import 'package:traveller/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                        //image: AssetImage("images\levender.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: "Kanishail",
                              color: Colors.black,
                            ),
                            AppLargeText(
                              text: "\$ 250",
                              color: Colors.purple,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: "Bangladesh, Sylhet",
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return Icon(
                                    Icons.stars,
                                    color: index < gottenStars
                                        ? Colors.amber
                                        : Colors.black54,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(5.0)",
                              color: Colors.green,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: "Number of people in your group",
                          color: Colors.blueGrey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : Colors.blue,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : Colors.grey,
                                    text: (index + 1).toString(),
                                    //icon: Icons.favorite_border,
                                    //isIcon: true,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                          text:
                              "You must go for travel. Travelling helps get rid of pressure. Go to the mountains to see the nature.",
                          color: Colors.blueGrey,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        size: 60,
                        color: Colors.black,
                        backgroundColor: Colors.white,
                        borderColor: Colors.black,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
