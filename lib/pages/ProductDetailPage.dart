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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name ?? ""),
      ),
      body: Column(
        children: [
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
