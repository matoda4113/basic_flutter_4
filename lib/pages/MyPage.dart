import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../vo/User.dart';

///MyPage
///담당자 : ---

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _UserpageState();
}

class _UserpageState extends State<MyPage> {

  User myInfo = User();
  @override
  void initState() {
    super.initState();

    getUserInfo();
    
  }

  void getUserInfo() async {

    String jsonString = await rootBundle.loadString('assets/json/user_json.json');
    User user = User.fromJson(json.decode(jsonString));
    setState(() {
      myInfo = user;
    });

  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("마이페이지")),
      body: Column(
        children: [
          SizedBox(height: 30,),
          SizedBox(
            width: 150,
            height: 150,
            child: Image.network(myInfo.profileImagePath??"",fit: BoxFit.cover,),
          ),
          SizedBox(height: 30,),
          Text(myInfo.name??""),
          Text("${myInfo.age}세")
        ],
        
      ),
    );
  }
}
