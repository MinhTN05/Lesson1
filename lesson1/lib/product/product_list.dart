import 'package:flutter/material.dart';
import 'package:lesson1/product/product_detail.dart';

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
  Drawer initDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFF9C27B0),
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Builder(
          builder: (BuildContext context) {
            return initDrawer(context);
          },
        ),
        appBar: AppBar(
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.menu,
          //     color: Colors.white,
          //   ),
          //   onPressed: () {},
          // ),
          title: Text("My shop"),
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
      "Vk 1",
      "https://i.pinimg.com/736x/cd/8f/e7/cd8fe7398a6d24e4392a65ca20a9356d.jpg",
      "\$5.6",
      false),
  Product(
      "Vk 2",
      "https://i.pinimg.com/736x/af/8e/b4/af8eb42f2f8c4e20a1364a14d3d73ce5.jpg",
      "\$9.8",
      false),
  Product(
      "Vk 3",
      "https://i.pinimg.com/736x/ed/f5/dc/edf5dce78a51703d7335d0a790755f8f.jpg",
      "\$5.4",
      false),
];

class ListProduct extends StatelessWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        childAspectRatio: 3 / 2,
        crossAxisCount: 2, // đặt các sản phẩm theo cột
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
