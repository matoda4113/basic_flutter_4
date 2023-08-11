import 'package:flutter/material.dart';

import '../vo/Product.dart';

class ProductDetailPage extends StatefulWidget {
  final Product item;

  const ProductDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPAgeState();
}

class _ProductDetailPAgeState extends State<ProductDetailPage> {

  bool isLike = false;

  late String welcomeText;

  @override
  void initState() {
    // TODO: implement initState
    welcomeText ="헬로우";
    super.initState();

  }

  Future<String> getUserName() async{
    print('1');
    return "김사랑";
  }

  Future<String> getUserName2() async{
    await Future.delayed(Duration(seconds: 3), () {
      print('2');
    });
    return "김수로";
  }

  Future<String> getUserName3() async{
    await Future.delayed(Duration(seconds: 3), () {
      print('3');
    });
    return "김꺽정";
  }

  void printUserName() async {
    String ddd = await getUserName();
    getUserName2();
    getUserName3();
    print(ddd);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name ?? ""),
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              printUserName();
            },
            child: Text("유저이름 프린트"),
          ),
          Text(welcomeText),
          SizedBox(
            height: 30,
          ),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 2 / 1,
                child: Image.network(
                  widget.item.imagePath ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(left: 10, bottom: 10, child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isLike = !isLike;
                    });
                  },
                  child: Icon(isLike?Icons.favorite:Icons.favorite_border,color: Colors.pink,)))
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(widget.item.name ?? ""),
          SizedBox(
            height: 10,
          ),
          Text("${widget.item.price} 원")
        ],
      ),
    );
  }
}
