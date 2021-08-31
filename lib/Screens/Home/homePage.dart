import 'dart:ui';
import 'package:book_store/constantParameters.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String? bookCoverImage = 'https://i.pinimg.com/originals/12/e7/30/12e730237d6426796848c8a9d4cadf2a.png';
    String? bookname = 'Harry Potter Edition';
    String? bookdiscountedPrice = '400';
    String? originalprice = '800';
    String? offerPercentage = '50';
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: defaultPadding),
              searchBox(size),
              SizedBox(height: defaultPadding *1.2),
              ImageSliderDemo(),
              SizedBox(height: defaultPadding *1.2 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Best Offers',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black),
                        )),
                  ),
                  GestureDetector( 
                    onTap: (){},
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              SizedBox(height: defaultPadding,),
              Container(
                height: 300,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding,),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ProductCard(size: size, bookCoverImage: bookCoverImage, bookname: bookname, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage);
                  },
                ),
              ),
              SizedBox(height: defaultPadding *2 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'New Arrivals',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black),
                        )),
                  ),
                  GestureDetector( 
                    onTap: (){},
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              SizedBox(height: defaultPadding,),
              Container(
                height: 300,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding,),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ProductCard(size: size, bookCoverImage: bookCoverImage, bookname: bookname, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage);
                  },
                ),
              ),
              SizedBox(height: defaultPadding *2 ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding * 1.5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Best Sellers',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                              color: Colors.black),
                        )),
                  ),
                  GestureDetector( 
                    onTap: (){},
                    child: Text(
                      'See all',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Colors.grey[800]),
                    ),
                  ),
                  SizedBox()
                ],
              ),
              SizedBox(height: defaultPadding,),
              Container(
                height: 300,
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding,),
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return ProductCard(size: size, bookCoverImage: bookCoverImage, bookname: bookname, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage);
                  },
                ),
              ),
             
              //SizedBox(height:defaultPadding*2),
            ],
          ),
        ),
      ),
    );
  }

  Center searchBox(Size size) {
    return Center(
      child: Card(
          elevation: 15,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
              width: size.width * 0.85,
              height: 50,
              child: TextFormField(
                cursorHeight: 25,
                decoration: InputDecoration(
                  labelText: "Search by book name",
                  labelStyle: TextStyle(color: kTextColor.withOpacity(0.9)),
                  border: InputBorder.none,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: EdgeInsets.only(bottom: 20),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    color: Colors.grey,
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.sort_sharp),
                    onPressed: () {},
                  ),
                ),
              ))),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.size,
    required this.bookCoverImage,
    required this.bookname,
    required this.bookdiscountedPrice,
    required this.originalprice,
    required this.offerPercentage,
  }) : super(key: key);

  final Size size;
  final String? bookCoverImage;
  final String? bookname;
  final String? bookdiscountedPrice;
  final String? originalprice;
  final String? offerPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width*0.6,
      height: 300,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Expanded(
              flex: 5,
             child: Image.network(bookCoverImage!),
               ),
           Expanded(
              flex: 2,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child: Text(bookname!,textAlign: TextAlign.center,maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),),
                 ),
                 SizedBox(height: defaultPadding*0.5,),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 14),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                     Text('₹$bookdiscountedPrice',style: TextStyle(color: kPrimaryColor,fontSize: 17,fontWeight:FontWeight.bold,),),
                     Text('₹$originalprice',style: TextStyle(color: kSecondaryColor,fontSize: 13,fontWeight:FontWeight.w500,decoration: TextDecoration.lineThrough),),
                     Text('$offerPercentage %Off',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                     ],
                   ),
                 ),
               ],
             ),

           ),
           Expanded(
             flex: 1,
             child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     Expanded(
                       flex: 1,
                       child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,size: 25,color: kPrimaryColor,),)),
                     Expanded(
                       flex: 2,
                       child: RawMaterialButton(
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10))),
                         onPressed: (){},
                         fillColor: kPrimaryColor,
                         splashColor: kSecondaryColor,
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                             Text('Add to cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
                           ],
                         ),
                       )),
                   ],
                 )
           )
          ],
        ),
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
    //  'https://images.unsplash.com/photo-1618666012174-83b441c0bc76?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8aGFycnklMjBwb3R0ZXIlMjBib29rc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    //  'https://static.wikia.nocookie.net/harrypotterwarnerbros/images/9/9f/Hp-posters.jpg/revision/latest?cb=20170415014633',
    //  'https://www.pngkey.com/png/full/805-8052451_star-wars-4-books-set-junior-novel-collection.png',
    //  'http://images6.fanpop.com/image/forum/224000/224445_1475007810653_full.png',
    //  'http://enchanting-dock.flywheelsites.com/wp-content/uploads/Game-of-Thrones-Books-600x600.png',
    //  'https://cultureoflifestudies.com/wp-content/uploads/2015/09/the-hunger-games-books-1-3-1024x768.jpeg',
    //  'https://i.pinimg.com/originals/12/e7/30/12e730237d6426796848c8a9d4cadf2a.png',
    //  'https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2014/7/30/1406718532907/396ff814-8791-451b-9214-6a9b86d54142-1360x2040.jpeg?width=700&quality=85&auto=format&fit=max&s=3d6d51084745f5032837132dacbaca76',
    'assets/images/welcome.png',
    'assets/images/start-here.png',
    'assets/images/offers.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: CarouselSlider(
          options: CarouselOptions(
              height: 160.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 600),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
          items: imgList
              .map(
                (item) => Container(
                  margin: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
              .toList(),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: kAnimationDuration,
                width: _current == entry.key ? 18.0 : 6.0,
                height: 6.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: _current == entry.key
                      ? kPrimaryColor
                      : kSecondaryColor.withOpacity(0.7),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
