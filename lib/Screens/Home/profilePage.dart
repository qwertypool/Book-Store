import 'package:book_store/Screens/PersonalDetails/favourites.dart';
import 'package:book_store/Screens/PersonalDetails/profile.dart';
import 'package:book_store/constantParameters.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String username = "User";
    String email = "demoemail@gmail.com";
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey, $username',
                      style: TextStyle(fontSize: 25, color: kPrimaryColor),
                    ),
                    SizedBox(height: defaultPadding*0.5,),
                    //Spacer(),
                    Text('$email',style: TextStyle(fontSize: 15, ))
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
                  },
                  child: CircleAvatar(
                    radius: 45,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/originals/b9/33/37/b933376b2af3c1dad244431a9cf64fde.jpg'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: Colors.grey[200],
          ),
          ListTile(
            title: Text('Orders',style: TextStyle(fontSize: 16,color: Colors.black),),
            subtitle: Text('Check your order status/tracks/etc',style: TextStyle(fontSize: 12,),),
            trailing: Icon(Icons.local_mall)
          ),
          Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: Colors.grey[200],
          ),
          ListTile(
            title: Text('Adress Information',style: TextStyle(fontSize: 16,color: Colors.black),),
            subtitle: Text('Your Address details',style: TextStyle(fontSize: 12,),),
            trailing: Icon(Icons.place)
          ),
          Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: Colors.grey[200],
          ),
          ListTile(
            title: Text('Payment Details',style: TextStyle(fontSize: 16,color: Colors.black),),
            subtitle: Text('Manage Payment details',style: TextStyle(fontSize: 12,),),
            trailing: Icon(Icons.payment)
          ),
          Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: Colors.grey[200],
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavouriteItems()));
            },
            title: Text('Wishlist',style: TextStyle(fontSize: 16,color: Colors.black),),
            subtitle: Text('Buy items saved in wishlist',style: TextStyle(fontSize: 12,),),
            trailing: Icon(Icons.favorite)
          ),
          Divider(
            thickness: 1,
            endIndent: 15,
            indent: 15,
            color: Colors.grey[200],
          ),
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            },
            title: Text('Profile',style: TextStyle(fontSize: 16,color: Colors.black),),
            subtitle: Text('Manage your Profile',style: TextStyle(fontSize: 12,),),
            trailing: Icon(Icons.person)
          ),
        ],
      ),
    ));
  }
}
