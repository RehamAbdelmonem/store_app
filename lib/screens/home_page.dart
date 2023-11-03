import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartPlus,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'New Trend',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
          child: FutureBuilder<List<ProductModel>>(
            future: AllProductService().getAllProduct(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 100,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index],);
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}

// class CustomCard extends StatelessWidget {
//   const CustomCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           height: 130,
//           width: 220,
//           decoration: BoxDecoration(boxShadow: [
//             BoxShadow(
//                 blurRadius: 50,
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 0,
//                 offset: Offset(10, 10))
//           ]),
//           child: const Card(
//             elevation: 10,
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'HandBag LV',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         r'$225',
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                       Icon(
//                         Icons.favorite,
//                         color: Colors.red,
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Positioned(
//           right: 32,
//           bottom: 85,
//             child: Image.network(
//           'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
//           height: 100,
//         )),
//       ],
//     );
//   }
// }
