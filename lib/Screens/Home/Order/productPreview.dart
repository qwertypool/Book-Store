import 'package:book_store/Components/productCard.dart';
import 'package:book_store/constantParameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPreview extends StatefulWidget {
  ProductPreview({Key? key}) : super(key: key);

  @override
  _ProductPreviewState createState() => _ProductPreviewState();
}

class _ProductPreviewState extends State<ProductPreview> {
  double _rating = 0.0;
      String? originalprice = '500';
      String? bookdiscountedPrice = '250';
      String? offerPercentage = '50';
      String? bookCoverImage = 'https://i.pinimg.com/originals/12/e7/30/12e730237d6426796848c8a9d4cadf2a.png';
      String? bookName = 'Harry Potter Harry Potter edition';
  @override
  Widget build(BuildContext context) {
    var writer;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_bag),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 300,
                child: Image.network(
                    'https://i.pinimg.com/originals/12/e7/30/12e730237d6426796848c8a9d4cadf2a.png'),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 50, 8),
                child: Text(
                  'Harry Potter Edition Harry Potter Edition  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black),
                ),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 4, 0, 4),
                      child: RatingBar.builder(
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 18,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                          setState(() {
                            _rating = rating;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('$_rating/5',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.black),),
                  SizedBox(width: 10,),
                  Text(' (1012 ratings)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: kSecondaryColor),)
                ],
              ),
             Padding(
               padding: const EdgeInsets.fromLTRB(20, 8, 12, 0),
               child: Row(
                 children: [
                  Text('Price:',style: TextStyle(color: kSecondaryColor,fontSize: 15,fontWeight:FontWeight.w500,),),
                  SizedBox(width: 8,),
                  Text('₹$bookdiscountedPrice',style: TextStyle(color: kPrimaryColor,fontSize: 17,fontWeight:FontWeight.bold,),),
                  SizedBox(width: 8,),
                  Text('₹$originalprice',style: TextStyle(color: kSecondaryColor,fontSize: 13,fontWeight:FontWeight.w500,decoration: TextDecoration.lineThrough),),
                  Text(' | ',style: TextStyle(color: Colors.grey[300],fontSize: 20,),),
                  Text('$offerPercentage %Off ',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                 ],
               ),
             ),
             Divider(
               height: 15,
               indent: 20,
               endIndent: 20,
               thickness: 1,
               color: Colors.grey[300],
             ),
              // Text('+ shipping fee*(Free shipping for orders above ₹500 within India)',style:TextStyle(color: Colors.black,fontSize: 12)),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 4, 10, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Writer : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        Text('J. K. Rowling',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Text('Publisher  : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        Text('	Bloomsbury Publishing ',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Text('Published : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        Text('26 June 1997 – 21 July 2007',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Text('Book Type : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        Text('Novel',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Text('Pages : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        Text('250',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    
                    SizedBox(height:5),
                    Row(
                      children: [
                        Text('Version : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        Text('1 ',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Text('ISBN  : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        Text('9788184767841 ',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    SizedBox(height:5),
                    Row(
                      children: [
                        Text('Tags  : ',style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor,fontSize: 15),),
                        // Chip(
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        //   label:Text(
                        //         'Novels',
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 10
                        //         ),
                        //       ),
                        //     //labelPadding: EdgeInsets.all(1.0),
                        //     backgroundColor: Colors.grey[800],
                        //     elevation: 6.0,
                        //     shadowColor: Colors.grey[60],
                        //     padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0)
                        // ),
                        Text('Fantacy Novels ',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black,fontSize: 14),),
                      ],
                    ),
                    
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                child: Card(
                  elevation: 12,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(icon: Icon(Icons.favorite_border),onPressed: (){},)
                    ),
                      Expanded(
                        flex: 3,
                        child: RawMaterialButton(
                          onPressed: (){},
                          fillColor:kPrimaryColor,
                          constraints: BoxConstraints(minHeight: 48),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shopping_cart_outlined,color: Colors.white,),
                              SizedBox(width: 10,),
                              Text('Add to cart',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,letterSpacing:1,))
                            ],
                          ),
                        )
                    ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About this Book', style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.bold,fontSize: 17),),
                    SizedBox(height: 12,),
                    Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                    style: TextStyle(color: Colors.black,fontSize: 14),
                    )
                  ],
                ),
              ),
              
              SizedBox(height: defaultPadding*1.2,),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 20, 12, 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Other Books By the Author',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.bold,fontSize: 17),),
                        Spacer(),
                        Text('View All',style: TextStyle(color: kPrimaryColor,),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 350,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ProductCard(size: MediaQuery.of(context).size, bookCoverImage: bookCoverImage, bookname: bookName, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage),
                          ProductCard(size: MediaQuery.of(context).size, bookCoverImage: bookCoverImage, bookname: bookName, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage),
                          ProductCard(size: MediaQuery.of(context).size, bookCoverImage: bookCoverImage, bookname: bookName, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  
                  ],
                ),
              ),
              SizedBox(height: defaultPadding*1.5,),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 20, 12, 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Similar category books',style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.bold,fontSize: 17),),
                        Spacer(),
                        Text('View All',style: TextStyle(color: kPrimaryColor,),),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 350,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ProductCard(size: MediaQuery.of(context).size, bookCoverImage: bookCoverImage, bookname: bookName, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage),
                          ProductCard(size: MediaQuery.of(context).size, bookCoverImage: bookCoverImage, bookname: bookName, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage),
                          ProductCard(size: MediaQuery.of(context).size, bookCoverImage: bookCoverImage, bookname: bookName, bookdiscountedPrice: bookdiscountedPrice, originalprice: originalprice, offerPercentage: offerPercentage),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  
                  ],
                ),
              ),
              SizedBox(height: defaultPadding*1.5,),
            ],
          ),
        ),
      ),
    );
  }
}
