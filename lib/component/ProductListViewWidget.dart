import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/ProductDetailPage.dart';
import '../vo/Product.dart';

class ProductListViewWidget extends StatefulWidget {
  final Product item;

  const ProductListViewWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<ProductListViewWidget> createState() => _ProductListViewWidgetState();
}

class _ProductListViewWidgetState extends State<ProductListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=>ProductDetailPage(item:widget.item));
      },
      child: Container(
        color: Colors.orange,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 100,
                width: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      widget.item.imagePath ?? "",
                      fit: BoxFit.cover,
                    ))),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.item.name??""),
                Text("${widget.item.price} 원")
              ],
            )
          ],
        ),
      ),
    );
  }
}
