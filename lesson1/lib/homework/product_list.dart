import 'package:flutter/material.dart';
import 'package:lesson1/homework/product_detail.dart';

import 'Product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          title: const Text(
            "My shop",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF9C27B0),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: ListProduct(),
      ),
    );
  }
}

final List<Product> listProduct = [
  Product(
      "Quần jean",
      "https://cdn2.yame.vn/pimg/quan-dai-trouser-on-gian-y-nguyen-ban-ver10-0020799/aa5b4096-8816-8b00-e0a6-001931327057.jpg?w=540&h=756",
      "\$5.6",
      false),
  Product(
      "Áo kitty",
      "https://bizweb.dktcdn.net/100/399/392/files/ao-thun-nam.png?v=1657015314169",
      "\$9.8",
      false),
  Product(
      "Quần ống",
      "https://zizoou.com/cdn/shop/files/Quan-jogger-tui-hop-4b-Quan-kaki-ong-tum-den-1-ZiZoou-Store-0000.jpg?v=1691078153",
      "\$5.4",
      false),
];

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2,
        children: [
          for (int i = 0; i < listProduct.length; i++)
            InkWell(
              child: ProductItem(
                product: listProduct[i],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => ProductDetail(listProduct[i])));
              },
            )
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (c) => ProductDetail(listProduct[i])));
          //   }, // Handle your callback
          //   child: ProductItem(
          //     product: listProduct[i],
          //   ),
          // )
        ]);
  }
}

class ProductItem extends StatefulWidget {
  final Product product;

  const ProductItem({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState(product);
}

class _ProductItemState extends State<ProductItem> {
  final Product product;

  _ProductItemState(this.product);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              product.image,
              width: screenSize.width / 2.0 - 16,
              //width: 200,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0))),
            height: 50,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    getFavoriteIcon(),
                    color: Color(0xFF9F28B4),
                  ),
                  onPressed: () {
                    setState(() {
                      product.favorite = !product.favorite;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    product.name,
                    maxLines: 1,
                    //Giúp cho định dạng chữ dài quá thì để ... cuối
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontSize: 14),
                  ),
                  //flex: 1,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF9F28B4),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  IconData? getFavoriteIcon() {
    if (product.favorite) {
      return Icons.favorite;
    } else {
      return Icons.favorite_border;
    }
  }
}