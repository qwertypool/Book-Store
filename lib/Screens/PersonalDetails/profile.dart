import 'package:book_store/constantParameters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  User? user = FirebaseAuth.instance.currentUser; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Profile',style: TextStyle(color: Colors.white),),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Spacer(),
           Stack(
             children: [
               CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/originals/b9/33/37/b933376b2af3c1dad244431a9cf64fde.jpg'),
                  ),
            Positioned(
              bottom:0,
              right: -10,
              child:IconButton(icon:Icon(Icons.photo_camera,size:35,),onPressed: (){},)
            ),
             ],
           ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: user!.displayName!,
                hintText: user!.displayName!,
              ),
            ),
          ),
          SizedBox(height: defaultPadding,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                labelText:'Phone Number' 
              ),
            ),
          ),
          SizedBox(height: defaultPadding,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText:'Email Address' 
              ),
            ),
          ),
          Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
