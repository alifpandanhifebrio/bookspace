import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:bookapp/core.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> {
    static late HomeController instance;
    late HomeView view;
    

     int currentIndex = 0;
  final CarouselController carouselController = CarouselController();
  int selectedIndex = 0;
  updateIndex(int newIndex) {
    selectedIndex = newIndex;
    setState(() {});
  }

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    

