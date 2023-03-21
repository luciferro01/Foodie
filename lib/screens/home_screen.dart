import 'package:flutter/material.dart';
import 'package:foodie/constant/color.dart';
import 'package:foodie/constant/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<HomeScreenWidget> homeScreenList = [
    HomeScreenWidget(
        name: 'UDAAN',
        // image:
        //     'https://tse2.mm.bing.net/th?id=OIP.rCMMnXL1oqQXeMRCId7JrQHaF1&pid=Api&P=0',
        image:
            'https://tse2.mm.bing.net/th?id=OIP.wBiXzzaheN4CG02znPrqugAAAA&pid=Api&P=0',
        address: 'Vivek Vihar, Jaipur',
        distance: '1.8km'),
    HomeScreenWidget(
        name: 'Apna Ghar',
        image:
            'https://tse2.mm.bing.net/th?id=OIP.wBiXzzaheN4CG02znPrqugAAAA&pid=Api&P=0',
        // image:
        //     'https://tse2.mm.bing.net/th?id=OIP.wBiXzzaheN4CG02znPrqugAAAA&pid=Api&P=0',
        address: 'Ram Nagar, Jaipur',
        distance: '10.7km'),
    HomeScreenWidget(
        name: 'Goonj',
        image:
            'https://tse2.mm.bing.net/th?id=OIP.wBiXzzaheN4CG02znPrqugAAAA&pid=Api&P=0',
        // image:
        //     'https://tse3.mm.bing.net/th?id=OIP.QuOJzoZBvwE4zcWjHJbOcAHaJr&pid=Api&P=0',
        address: 'Chandpole, Jaipur',
        distance: '25.8km'),
    HomeScreenWidget(
        name: 'HNM',
        image:
            'https://tse2.mm.bing.net/th?id=OIP.wBiXzzaheN4CG02znPrqugAAAA&pid=Api&P=0',
        // image:
        //     'https://tse3.mm.bing.net/th?id=OIP.jieDPyMKzK3hdZFHim52kAAAAA&pid=Api&P=0',
        address: 'Mansarovar, Jaipur',
        distance: '16.5km'),
    HomeScreenWidget(
        name: 'Pratham',
        image:
            'https://tse2.mm.bing.net/th?id=OIP.wBiXzzaheN4CG02znPrqugAAAA&pid=Api&P=0',
        // image:
        //     'https://tse4.mm.bing.net/th?id=OIP.c5J1YlNio1JNPAAx_JVPSAHaEQ&pid=Api&P=0',
        address: 'Shyam Nagar',
        distance: '28.8km'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: softWhite,
        appBar: AppBar(
          backgroundColor: mainColor,
          automaticallyImplyLeading: false,
          leading: Container(
            margin: const EdgeInsets.all(10),
            child: CircleAvatar(
              child: Image.asset(
                'assets/images/foodie_logo.png',
              ),
            ),
          ),
          title: Text(
            'FOODIES',
            style: labelTextStyle,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                Icons.account_circle_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              margin: const EdgeInsets.only(right: 35),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(0),
                  icon: const Icon(Icons.search),
                  hintText: 'Search Anything',
                  // border: BorderRadius.circular(20)),
                  // border:
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      width: 1,
                      color: Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(
                      style: BorderStyle.solid,
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  hintStyle: fadedTextStyle,
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  // prefixStyle: TextStyle(color: Colors.black),
                ),
                style: labelTextStyle,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: homeScreenList.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: secondaryCircleColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: [
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.26,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Image.network(
                          homeScreenList[index].image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeScreenList[index].address,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              homeScreenList[index].distance,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
