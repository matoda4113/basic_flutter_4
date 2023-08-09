import 'package:flutter/material.dart';

import '../component/ProductGridViewWIdget.dart';
import '../component/ProductListViewWidget.dart';
import '../vo/Product.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {


  int mode = 0;
  List<Product> productList = [
    Product(name: "포도", price: 3000, imagePath: "https://www.100ssd.co.kr/news/photo/202208/89896_70031_1951.jpg"),
    Product(name: "사과", price: 5000, imagePath: "https://i.namu.wiki/i/QHZlaOvDdhvtLDYrA6IRvUZdddgwY9q5d0rMBywEIh7dbcNTCzTmE2CDM05JA9GRuXWqp5LsxE_T8BvGNOJhVA.webp"),
    Product(name: "두부", price: 6000, imagePath: "https://img-cf.kurly.com/shop/data/goodsview/20220314/gv30000288794_1.jpg"),
    Product(name: "어묵", price: 7000, imagePath: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Street_eomuk.jpg/1200px-Street_eomuk.jpg"),
    Product(name: "고무장갑", price: 8000, imagePath: "https://i.namu.wiki/i/Jy215uAViB3zyPM0uVkNkfFhP23gKnqTLtGN-F1iwWHottqISCSQrGkBJo9LIFcrMboEBDFoNNZgF6pGwX3EPA.webp"),
    Product(name: "비닐팩", price: 9000, imagePath: "https://m.tntpack.co.kr/web/product/big/201604/887_shop1_382294.jpg"),
    Product(name: "쌍스바", price: 500, imagePath: "https://img1.daumcdn.net/thumb/R1280x0.fpng/?fname=http://t1.daumcdn.net/brunch/service/user/4Slv/image/ebG80keywECvkxmNPYoVrbxVaAw.png"),
    Product(name: "메두나", price: 500, imagePath: "https://www.bebeyam.com/wp-content/uploads/2020/07/binggrae-melona-8-768x1024.jpg"),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("싱싱마을"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mode = 0;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: mode == 0 ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("그리드 뷰"),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mode = 1;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: mode == 1 ? Colors.blue : Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text("리스트 뷰"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if(mode==0)
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2개의 열로 구성된 그리드
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10, // 가로 세로 비율을 1:2로 설정
                    ),
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return ProductGridViewWidget(item: productList[index]);
                    })),
            if(mode==1)
              Expanded(
                  child: ListView.builder(

                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return ProductListViewWidget(item: productList[index]);
                      }))
          ],
        ),
      ),
    );
  }
}
