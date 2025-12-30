import 'package:flutter/material.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView(
        controller: _pageController,
        padEnds: false,

        children: [
          CarouselItem(
            imagePath: 'assets/images/logo_1.png',
            name: 'Glamour Hair & Beauty',
          ),
          CarouselItem(
            imagePath: 'assets/images/logo_2.png',
            name: 'The Nail Bar',
          ),
          CarouselItem(
            imagePath: 'assets/images/logo_3.png',
            name: 'Serenity Spa & Salon',
          ),
          CarouselItem(
            imagePath: 'assets/images/logo_4.png',
            name: 'Serenity Spa & Salon',
          ),
          CarouselItem(
            imagePath: 'assets/images/logo_5.png',
            name: 'Serenity Spa & Salon',
          ),
          CarouselItem(
            imagePath: 'assets/images/logo_6.png',
            name: 'Serenity Spa & Salon',
          ),
          CarouselItem(
            imagePath: 'assets/images/logo_7.png',
            name: 'Serenity Spa & Salon',
          ),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  final String imagePath;
  final String name;

  const CarouselItem({Key? key, required this.imagePath, required this.name})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
