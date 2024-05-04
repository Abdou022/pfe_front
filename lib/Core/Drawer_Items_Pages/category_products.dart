import 'package:find_me/Core/Search/product_detail.dart';
import 'package:find_me/Services/category_api.dart';
import 'package:find_me/Services/shop_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryProducts extends StatefulWidget {
  const CategoryProducts({super.key, required this.id});
  final String id;

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  List<dynamic> prods = [];
  CategoryApiCall _categoryApiCall = CategoryApiCall();
  bool isLoading = true;
  
@override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  Future<void> fetchCategoryProducts() async {
    try {
      final apiService = CategoryApiCall();
      
      final prods = await apiService.fetchCategoryProducts(widget.id).whenComplete(() => setState(() {
              isLoading = false;
            }));// Replace with actual lat and long values

      setState(() {
        this.prods = prods;
      });
    } catch (error) {
      // Handle errors
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF1E1),
      appBar: AppBar(
        title: Text("Products", style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                color: Colors.black,
                fontSize: 18)),
        centerTitle: true,
        backgroundColor: Color(0xFFFDF1E1),
      ),
      body: isLoading? Center(child: CircularProgressIndicator(color: Color(0xFF965D1A)),) :SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<List<dynamic>>(
                future: _categoryApiCall.fetchCategoryProducts(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.hasData){
                    
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder:(context, index) {
                        final prod= prods[index];
                        final thumbnail = prod['thumbnail'];
                        final name = prod['name'];
                        final id= prod['id'];
                        final brand= prod['brand'];
                        final rating= prod['rating'];
                        final price= prod['price'];
                        return  InkWell(
                          onTap: () {
                            print("Page search products: $id");
                              Navigator.push(context, CupertinoPageRoute(builder: (context) => ProductDetail(identifier: id),));
                          },
                          child: Container(
                          margin: const EdgeInsets.only(left: 2),
                          child: Row(
                                  children: [
                                    Container(
                                      clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10)),
                                        child: 
                                        Image.network("$thumbnail",height: MediaQuery.of(context).size.width*0.3,
                                         width: 110,
                                         fit: BoxFit.fill,),
                                    ),
                                    Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, left: 20),
                                      child: SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "$name",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "$brand",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 11,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star_rate_rounded,
                                                  color: Color(0xFFFFBD59),
                                                ),
                                                const SizedBox(
                                                  width: 2,
                                                ),
                                                Text(
                                                  "$rating",
                                                  style: const TextStyle(
                                                      color: Color(0xFFFFBD59)),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "$price"
                                              r" DT",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                                fontFamily: 'Poppins',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 3,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                /*
                                                // Check if the product is in the favorite list
                                                if (isInFavorites) {
                                                  // If the product is already in favorites, remove it
                                                  controller.removeFromFavorites(
                                                      controller.productsModel!
                                                          .products![index]);
                                                } else {
                                                  // If the product is not in favorites, add it
                                                  controller.addToFavorites(
                                                      controller.productsModel!
                                                          .products![index]);
                                                }
                                                //  Get.to(() => FavoritesPage());
                                                */
                                              },
                                              child: Icon(
                                                Icons.favorite_rounded,
                                                color: Colors.grey,
                                                /*isInFavorites                           //khedmet khadija
                                                    ? Colors.red
                                                    : null,*/
                                                size: 20,
                                              ),
                                            ),
                          
                                            /* InkWell(
                                              onTap: () {
                                                if (isFavorite) {
                                                  controller.removeFromFavorites(
                                                      controller.productsModel!
                                                          .products![index]);
                                                } else {
                                                  controller.addToFavorites(
                                                      controller.productsModel!
                                                          .products![index]);
                                                }
                                                Get.to(() => FavoritesPage());
                                              },
                                              child: Icon(
                                                Icons.favorite_rounded,
                                                color: isFavorite
                                                    ? Colors.red
                                                    : null,
                                                size: 20,
                                              ),
                                            ),*/
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                  ],
                                ),
                                                ),
                        );},
                     separatorBuilder:(context, index) => SizedBox(height: 10,),
                     itemCount: snapshot.data!.length);
                  }
                  else{
                    return Center(child: CircularProgressIndicator(color: Color(0xFF965D1A),),);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}