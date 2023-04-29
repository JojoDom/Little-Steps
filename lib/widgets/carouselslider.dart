import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselSliderPage extends StatelessWidget {
  const CarouselSliderPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options :CarouselOptions(
         height: MediaQuery.of(context).size.height*0.4,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 900),
                viewportFraction: 0.75,
                pauseAutoPlayOnTouch: false,
                
      ),

      items: [
        // first image
        SizedBox(
          height: 500,
          child: Image.asset('assets/images/kids.jpeg', width: double.infinity,)),
       SizedBox(
         height: 500,
         child: Image.asset('assets/images/kids1.png',width: double.infinity,)),
       SizedBox(
         height: 500,
         child: Image.asset('assets/images/kids2.jpeg',width: double.infinity,)),
      SizedBox(
        height: 500,
        child: Image.asset('assets/images/kids3.jpeg',width: double.infinity,)),    
      ]
      
    );
  }
}
