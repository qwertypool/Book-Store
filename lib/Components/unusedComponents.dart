//It will have all the unused/removed code components which might be used later

//Unused color -
//fillColor: Color.fromRGBO(191, 191, 201, 0.9),    for sign up with google button
// color: Color(0xff404F5F), for sign up text


//For test box style -->>
// hintText: "Enter Your Password",
// hintStyle:
//     TextStyle(fontSize: 15, color: kSecondaryColor.withOpacity(0.95)),
// floatingLabelBehavior: FloatingLabelBehavior.always,



// Sign up with SOCIAL medias -->>
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     SocalCard(
//       icon: "assets/svgs/google.svg",
//       press: () {},
//     ),
//     SocalCard(
//       icon: "assets/svgs/facebook.svg",
//       press: () {},
//     ),
//     SocalCard(
//       icon: "assets/svgs/twitter.svg",
//       press: () {},
//     ),
//   ],
// ),


//Sign In or Sign Up description text
// Text(
//   'Sign in with email/password \nor continue with social media',
//   textAlign: TextAlign.center,
//   style: TextStyle(
//       letterSpacing: 1,
//       //fontSize: 14,
//       fontWeight: FontWeight.w500),
// ),


//Textbox

// Container(
//   width: size.width*0.85,
//   height: 50,
//   decoration: BoxDecoration(
//     borderRadius:BorderRadius.circular(50)
//     ),
//   child: Center(
//     child: Form(child: TextFormField(
//       obscureText: true,
//       style: TextStyle(fontSize: 24),
//       keyboardType: TextInputType.number,
//       textAlign: TextAlign.center,
//       cursorHeight: 25,
//       decoration: InputDecoration(
//         border: InputBorder.none,
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: kSecondaryColor)
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: kSecondaryColor)
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(30),
//           borderSide: BorderSide(color: kSecondaryColor)
//         ),
//       )
//     )),
//   ),
// ),

//Container for card
// Container(
//                     child: Center(
//                         child: Stack(
//                           children: [
//                             Container(
//                               width: 1200,
//                              // height : 120,
//                               decoration:BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 image: DecorationImage(
//                                   image: AssetImage(item),
//                                   fit: BoxFit.fitHeight,)),
//                                   ),
//                               //: Image.network(item, fit: BoxFit.cover, width: 1200)),
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 10,bottom: 6),
//                                 child: ClipRect(

//                                   child: BackdropFilter(
//                                     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                                     child: Container(
//                                       width: 120,
//                                       height: 30,
//                                       decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.grey.withOpacity(0.5),
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                       children: [
//                                         Text('Shop Now',style: TextStyle(color: Colors.white,fontFamily: 'Ubuntu',letterSpacing: 2,fontWeight: FontWeight.w600),),
//                                         Icon(Icons.arrow_forward_ios,color: Colors.white,size: 15,),
//                                       ],
//                                     ),
//                                     ),
                                
//                                   ),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )),
//                   ),




// Products cart->
// Container(
//                width: size.width*0.6,
//                height: 300,
//                child: Card(
//                  elevation: 10,
//                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                  child: Column(
//                    children: [
//                      Expanded(
//                        flex: 5,
//                       child: Image.network('https://i.pinimg.com/originals/12/e7/30/12e730237d6426796848c8a9d4cadf2a.png'),
//                         ),
//                     Expanded(
//                        flex: 2,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 10),
//                             child: Text('Harry Potter edition ',textAlign: TextAlign.center,maxLines: 2, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),),
//                           ),
//                           SizedBox(height: defaultPadding*0.5,),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 14),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                               Text('₹400',style: TextStyle(color: kPrimaryColor,fontSize: 17,fontWeight:FontWeight.bold,),),
//                               Text('₹800',style: TextStyle(color: kSecondaryColor,fontSize: 15,fontWeight:FontWeight.w500,decoration: TextDecoration.lineThrough),),
//                               Text('50% Off',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15)),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),

//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined,size: 30,color: kPrimaryColor,),)),
//                               Expanded(
//                                 flex: 2,
//                                 child: RawMaterialButton(
//                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),topLeft: Radius.circular(10))),
//                                   onPressed: (){},
//                                   fillColor: kPrimaryColor,
//                                   splashColor: kSecondaryColor,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                     children: [
//                                       Icon(Icons.shopping_cart_outlined,color: Colors.white,),
//                                       Text('Add to cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
//                                     ],
//                                   ),
//                                 )),
//                             ],
//                           )
//                     )
//                    ],
//                  ),
//                ),
//              )