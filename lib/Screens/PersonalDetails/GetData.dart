import 'package:book_store/Components/productCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  //   Stream<QuerySnapshot> queryStream(BuildContext context) async* {
  //   yield* FirebaseFirestore.instance
  //       .collection('products')
  //       .limit(2)
  //       .orderBy('bookname')
  //       .snapshots();
  // }
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('Books')
      .limit(4)
      .orderBy('bookname')
      .snapshots();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   var data = _usersStream.first;
  //   Map<String, dynamic> data1 = data as Map<String, dynamic>;
  //   print(data1);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> data =
                    snapshot.data!.docs[index].data()! as Map<String, dynamic>;
                return ProductCard(
                    size: MediaQuery.of(context).size,
                    bookCoverImage: data['bookCoverImage'],
                    bookname: data['bookname'],
                    bookdiscountedPrice: data['bookdiscountedPrice'].toString(),
                    originalprice: data['originalprice'].toString(),
                    offerPercentage: data['offerPercentage'].toString()
                );
              });
        },
      ),
    );
  }
}
