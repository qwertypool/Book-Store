import 'package:book_store/constantParameters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavouriteItems extends StatefulWidget {
  FavouriteItems({Key? key}) : super(key: key);

  @override
  _FavouriteItemsState createState() => _FavouriteItemsState();
}

class _FavouriteItemsState extends State<FavouriteItems> {

  @override
  Widget build(BuildContext context) {
      String? originalprice = '500';
      String? bookdiscountedPrice = '250';
      String? offerPercentage = '50';
      String? bookCoverImage = 'https://i.pinimg.com/originals/12/e7/30/12e730237d6426796848c8a9d4cadf2a.png';
      String? bookName = 'Harry Potter Harry Potter edition';
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.white,),
        title: Text("Wishlist",style: TextStyle(color: Colors.white),),
        backgroundColor: kPrimaryColor,
      ),
      body: SingleChildScrollView(
        
        child: Column(
          children: [
            favouriteProductMethod(context, bookCoverImage, bookName, bookdiscountedPrice, originalprice, offerPercentage),
            favouriteProductMethod(context, bookCoverImage, bookName, bookdiscountedPrice, originalprice, offerPercentage),
            favouriteProductMethod(context, bookCoverImage, bookName, bookdiscountedPrice, originalprice, offerPercentage),
            favouriteProductMethod(context, bookCoverImage, bookName, bookdiscountedPrice, originalprice, offerPercentage),
            favouriteProductMethod(context, bookCoverImage, bookName, bookdiscountedPrice, originalprice, offerPercentage),
          ],
        ),
      ),
    );
  }

  Padding favouriteProductMethod(BuildContext context, String bookCoverImage, String bookName, String bookdiscountedPrice, String originalprice, String offerPercentage) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal:10,vertical: 8),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.95,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Image.network(bookCoverImage,fit: BoxFit.fitHeight,)
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        Text(bookName,overflow: TextOverflow.ellipsis,maxLines: 2, style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black,),),
                                        SizedBox(height: defaultPadding,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text('₹$bookdiscountedPrice',style: TextStyle(color: kPrimaryColor,fontSize: 17,fontWeight:FontWeight.bold,),),
                                            SizedBox(width: 8,),
                                            Text('₹$originalprice',style: TextStyle(color: kSecondaryColor,fontSize: 13,fontWeight:FontWeight.w500,decoration: TextDecoration.lineThrough),),
                                            Text(' | ',style: TextStyle(color: Colors.grey[300],fontSize: 20,),),
                                            Text('$offerPercentage %Off',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Align(
                                          alignment: Alignment.topLeft,
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
                                          },
                                        ),
                                        ),
                                      ],
                                    ),
                                  )
                                )
                              ],
                            ),
                          ),
                          Divider(
                            indent: 10,
                            endIndent: 200,
                            thickness: 1,
                            height: 0,
                          ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,size: 25,color: kPrimaryColor,),)),
                                    Expanded(
                                      flex: 2,
                                      child: RawMaterialButton(
                                        constraints: BoxConstraints(minHeight: 60),
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
                                ),
                              )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            
            ),
          );
  }
}
