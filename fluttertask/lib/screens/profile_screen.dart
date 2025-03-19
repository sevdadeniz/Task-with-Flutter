import 'package:flutter/material.dart';
import 'package:fluttertask/widgets/appBar/app_bar_widget.dart';
import 'package:fluttertask/widgets/circleAvatar/circle_avatar_widget.dart';
import 'package:fluttertask/widgets/lists/row_list_style_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Profilim"),
      backgroundColor: Colors.white,

      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10, right: 10, left: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(
                    0,
                    4,
                  ), // Sadece alt kısmına kayacak şekilde 4 birim aşağı kaydırma
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatarWidget(
                  radius: 50,
                  imageUrl: 'assets/images/image.jpg',
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "kullanıcıadı",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'DancingScript',
                      ),
                    ),

                    Text("Ad Soyad", style: TextStyle(fontSize: 15)),
                  ],
                ),
              ],
            ),
          ),
          RowListStyleWidget(title: 'Tema', onPressed: () {}),
          RowListStyleWidget(title: 'Dil', onPressed: () {}),
        ],
      ),
    );
  }
}
