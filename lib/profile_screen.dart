import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding:   EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: CircleAvatar(
                radius: 55,
                backgroundColor: Colors.orange,
              ),),
              SizedBox(height: 20,),
              Center(child: Text('Profile',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 30),),),
              SizedBox(height: 8,),
              Center(child: Text('Member 2024',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),)),
              SizedBox(height: 60,),
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xFF27211B),
                          radius: 30,
                          child: Icon(Icons.person,size: 34,),
                        ),
                        SizedBox(width: 20,),
                        Text('Person Informatosn',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 17),)
                      ],
                    ),
                    Icon(Icons.keyboard_arrow_right_sharp,size: 30,color: Colors.orange,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
