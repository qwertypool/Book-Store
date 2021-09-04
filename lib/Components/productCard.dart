import 'package:book_store/Screens/Home/Order/productPreview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../constantParameters.dart';

class ProductCard extends StatelessWidget {
   ProductCard({
    Key? key,
    required this.size,
    required this.bookCoverImage,
    required this.bookname,
    required this.bookdiscountedPrice,
    required this.originalprice,
    required this.offerPercentage,
    this.authorName,
  }) : super(key: key);

  final Size size;
  final String? bookCoverImage;
  final String? bookname;
  final String? bookdiscountedPrice;
  final String? originalprice;
  final String? offerPercentage;
  String? authorName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductPreview()));
        },
        child: Container(
          width: size.width * 0.6,
          height: 340,
          child: Card(
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
                        child: Text(
                          bookname!,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: defaultPadding * 0.5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '₹$bookdiscountedPrice',
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '₹$originalprice',
                              style: TextStyle(
                                  color: kSecondaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text('$offerPercentage %Off',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
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
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_border_outlined,
                                size: 25,
                                color: kPrimaryColor,
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: RawMaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      topLeft: Radius.circular(10))),
                              onPressed: () {},
                              fillColor: kPrimaryColor,
                              splashColor: kSecondaryColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Add to cart',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
