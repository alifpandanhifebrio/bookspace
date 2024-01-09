import 'package:bookapp/core.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60, right: 32, left: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: 'Book',
                  style: GoogleFonts.montserrat(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Space.',
                      style: GoogleFonts.montserrat(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1F73D6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              Builder(
                builder: (context) {
                  List images = [
                    "assets/image/banner1.jpg",
                    "assets/image/banner2.jpg",
                  ];

                  return Column(
                    children: [
                      CarouselSlider(
                        carouselController: controller.carouselController,
                        options: CarouselOptions(
                          height: 200.0,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            controller.currentIndex = index;
                            controller.setState(() {});
                          },
                        ),
                        items: images.map((imageUrl) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8.0),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: images.asMap().entries.map((entry) {
                          bool isSelected =
                              controller.currentIndex == entry.key;
                          return GestureDetector(
                            onTap: () => controller.carouselController
                                .animateToPage(entry.key),
                            child: Container(
                              width: isSelected ? 20 : 6.0,
                              height: 6.0,
                              margin: const EdgeInsets.only(
                                right: 6.0,
                                top: 12.0,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white
                                    : const Color(0xff3c3e40),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12.0),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Builder(
                builder: (context) {
                  List imagesgrid = [
                    "assets/image/tech.jpg",
                    "assets/image/comics.jpg",
                    "assets/image/social.jpg",
                    "assets/image/science.jpg",
                    "assets/image/more.jpg"
                  ];
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      crossAxisCount: 5,
                      mainAxisSpacing: 6,
                      crossAxisSpacing: 6,
                    ),
                    itemCount: imagesgrid.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              imagesgrid[index],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Tech',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Comics',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Social',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Science',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'More',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(
                height: 24.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Continue Reading',
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'View More',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Card(
                            child: InkWell(
                              child: Container(
                                height: 277,
                                width: 128,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Image.asset('assets/image/book1.jpg'),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Container(
                                            height: 24,
                                            width: 55,
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            child: Center(
                                              child: Text(
                                                'P: 247/312',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                              padding: const EdgeInsets.only(
                                                  top: 6, left: 8),
                                              height: 24,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: const BoxDecoration(
                                                gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff4743E7),
                                                      Color(0xff50C8FC)
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight),
                                              ),
                                              child: Text(
                                                'Best On Philosophy',
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.white,
                                                    fontSize: 8,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          top: 12, right: 12, left: 12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Meditations',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 4.0,
                                          ),
                                          Text(
                                            'Marcus Aurelius',
                                            style: GoogleFonts.montserrat(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          const SizedBox(
                                            height: 8.0,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/image/star.svg'),
                                              Text(
                                                '4.9',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '|',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                '10k reader',
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 9,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
