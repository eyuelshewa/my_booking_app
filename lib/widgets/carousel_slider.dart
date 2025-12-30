import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselSlider extends StatefulWidget {
  const CarouselSlider({Key? key}) : super(key: key);

  @override
  _CarouselSliderState createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  final List<Map<String, String>> _carouselItems = [
    {
      'imagePath': 'assets/images/logo_1.png',
      'name': 'Glamour Hair & Beauty',
    },
    {
      'imagePath': 'assets/images/logo_2.png',
      'name': 'The Nail Bar',
    },
    {
      'imagePath': 'assets/images/logo_3.png',
      'name': 'Serenity Spa & Salon',
    },
    {
      'imagePath': 'assets/images/logo_4.png',
      'name': 'Serenity Spa & Salon',
    },
    {
      'imagePath': 'assets/images/logo_5.png',
      'name': 'Serenity Spa & Salon',
    },
    {
      'imagePath': 'assets/images/logo_6.png',
      'name': 'Serenity Spa & Salon',
    },
    {
      'imagePath': 'assets/images/logo_7.png',
      'name': 'Serenity Spa & Salon',
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            padEnds: false,
            itemCount: _carouselItems.length,
            itemBuilder: (context, index) {
              return CarouselItem(
                imagePath: _carouselItems[index]['imagePath']!,
                name: _carouselItems[index]['name']!,
              );
            },
          ),
        ),
        SizedBox(height: 12),
        SmoothPageIndicator(
          controller: _pageController,
          count: _carouselItems.length,
          effect: WormEffect(
            dotHeight: 10,
            dotWidth: 10,
            activeDotColor: Theme.of(context).primaryColor,
            paintStyle: PaintingStyle.fill,
          ),
        ),
      ],
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
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            child: Image.asset(
              imagePath,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
