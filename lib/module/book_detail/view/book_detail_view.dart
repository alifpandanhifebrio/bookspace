import 'package:bookapp/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailView extends StatefulWidget {
  const BookDetailView({Key? key}) : super(key: key);

  Widget build(context, BookDetailController controller) {
    controller.view = this;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                // Container(
                //   color: Colors.white,
                // ),
                Container(
                  height: 230,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff575757), Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Center(
                  // child: SvgPicture.asset('assets/image/book_detail.svg'),
                  child: Image.asset('assets/image/book_detail.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 32, right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: SvgPicture.asset(
                            'assets/icons/arrow_left_white.svg',
                            width: 20,
                            height: 20,
                          )),
                      SvgPicture.asset('assets/icons/three_line.svg',
                          width: 20, height: 20),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 32, bottom: 10),
              height: 35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff4743E7), Color(0xff50C8FC)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight),
              ),
              child: Text(
                'Best On Philosophy',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, right: 32, left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Meditations',
                        style: GoogleFonts.montserrat(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SvgPicture.asset('assets/icons/love.svg'),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'by',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' Marcus Aurelius',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Read 10k+',
                        style: GoogleFonts.montserrat(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      SvgPicture.asset('assets/image/star.svg'),
                      Text(
                        '4.9(128)',
                        style: GoogleFonts.montserrat(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      SvgPicture.asset('assets/icons/heart_broken.svg'),
                      Text(
                        '10k+',
                        style: GoogleFonts.montserrat(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Most Popular',
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' in Stoicism',
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Text(
                    'Book Detail',
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Release Date',
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        '612 AD',
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: const Color(0xffF0F0F0),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Category',
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Text(
                        'Self Development',
                        style: GoogleFonts.montserrat(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1,
                    color: const Color(0xffF0F0F0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomSheet: Padding(
        padding:
            const EdgeInsets.only(top: 24, right: 32, left: 32, bottom: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: const Color(0xff1F73D6),
                  ),
                  borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  icon: SvgPicture.asset('assets/icons/share.svg')),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: const Color(0xff1F73D6),
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: IconButton(
                  style: const ButtonStyle(),
                  onPressed: () {},
                  icon: Text(
                    'Add to Library',
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff1F73D6)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: SizedBox(
                height: 53,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                      backgroundColor: const Color(0xff1F73D6),
                      foregroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(
                    'Read Now',
                    style: GoogleFonts.montserrat(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("data"),
          leading: IconButton(
            icon: const Icon(Icons.ac_unit),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
    );
  }

  @override
  State<BookDetailView> createState() => BookDetailController();
}
