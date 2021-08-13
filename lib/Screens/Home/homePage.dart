import 'dart:ui';

import 'package:book_store/constantParameters.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height:defaultPadding),
          searchBox(size),
          SizedBox(height:defaultPadding*2),
          ImageSliderDemo(),
    ],
   ),
  );
 }

  Center searchBox(Size size) {
    return Center(
          child: Card(
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
             width: size.width*0.85,
             height: 50,
            child: TextFormField(
              cursorHeight: 25,
            
              decoration: InputDecoration(
                labelText: "Search by book name",
                labelStyle: TextStyle(color: kTextColor.withOpacity(0.9)),
                border: InputBorder.none,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: EdgeInsets.only(bottom: 20),
                prefixIcon:  IconButton(
                      icon: Icon(Icons.search),
                      color: Colors.grey,
                      onPressed: () {},
                    ),
                suffixIcon: IconButton(
                      icon: Icon(Icons.sort_sharp),
                      onPressed: () {},
                    ),
              ),
            )
          )
      ),
    );
  }
}


class ImageSliderDemo extends StatefulWidget {
  @override
  _ImageSliderDemoState createState() => _ImageSliderDemoState();
}
 int _current = 0;
 final CarouselController _controller = CarouselController();
class _ImageSliderDemoState extends State<ImageSliderDemo> {
  final List<String> imgList = [
   //'https://images.unsplash.com/photo-1618666012174-83b441c0bc76?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aGFycnklMjBwb3R0ZXIlMjBib29rc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
   'https://static.wikia.nocookie.net/harrypotterwarnerbros/images/9/9f/Hp-posters.jpg/revision/latest?cb=20170415014633',
   'https://www.pngkey.com/png/full/805-8052451_star-wars-4-books-set-junior-novel-collection.png',
   'http://images6.fanpop.com/image/forum/224000/224445_1475007810653_full.png',
   'http://enchanting-dock.flywheelsites.com/wp-content/uploads/Game-of-Thrones-Books-600x600.png',
   'https://cultureoflifestudies.com/wp-content/uploads/2015/09/the-hunger-games-books-1-3-1024x768.jpeg',
   'https://i.pinimg.com/originals/12/e7/30/12e730237d6426796848c8a9d4cadf2a.png',
    'https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2014/7/30/1406718532907/396ff814-8791-451b-9214-6a9b86d54142-1360x2040.jpeg?width=700&quality=85&auto=format&fit=max&s=3d6d51084745f5032837132dacbaca76',
    
    
  ];
  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            //aspectRatio: 1.5,
            autoPlay:true,
            autoPlayInterval: Duration(seconds: 2),
            pauseAutoPlayOnTouch: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
          ),
          items: imgList
              .map((item) => Container(
                    child: Center(
                        child: Stack(
                          children: [
                            Container(
                              width: 1200,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.fitHeight,)),
                                  ),
                              //: Image.network(item, fit: BoxFit.cover, width: 1200)),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10,bottom: 6),
                                child: ClipRect(

                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                    child: Container(
                                      width: 120,
                                      height: 30,
                                      decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('Shop Now',style: TextStyle(color: Colors.white,fontFamily: 'Ubuntu',letterSpacing: 2,fontWeight: FontWeight.w600),),
                                        Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,),
                                      ],
                                    ),
                                    ),
                                    
                                  ),
                                ),
                              ),
                            )
                          ],
                        )),
                  ))
              .toList(),
        )),
              Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imgList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: AnimatedContainer(
              duration: kAnimationDuration,
              width: _current == entry.key ?18.0:6.0,
              height: 6.0,
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                  // shape: _current == entry.key ? BoxShape.rectangle: BoxShape.circle,
                 // shape: BoxShape.circle,
                 borderRadius: BorderRadius.circular(3),
                  color: _current == entry.key ? kPrimaryColor : kSecondaryColor.withOpacity(0.7),
                  // color: (Theme.of(context).brightness == Brightness.dark
                  //         ? Colors.white
                  //         : Colors.black)
                  //     .withOpacity(_current == entry.key ? 0.9 : 0.4)
              ),
            ),
          );
        }).toList(),
      ),
      ],

    );
  }
}