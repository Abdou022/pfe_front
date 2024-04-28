import 'package:find_me/Models/prod_filter.dart';
import 'package:find_me/Models/product_model.dart';
import 'package:find_me/Services/product_api.dart';
import 'package:find_me/widgets/appbarwidget.dart';
import 'package:find_me/widgets/drawerwidget.dart';
import 'package:find_me/widgets/searchfieldwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key, this.req});
  final ProductFilter? req;


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ProductApiCall _productApiCall = ProductApiCall();
  ProductFilter? requette = ProductFilter(
      name: '',
      size: [],
      colors: '',
      sortBy: '',
      sortOrder: 'desc',
      region: '');
  TextEditingController _searchController = TextEditingController();
  int? nb = 0;

  void _handleFilterSubmitted(ProductFilter data) {
    setState(() {
      requette = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF1E1),
      drawer: DrawerWidget(),
      appBar: AppBarWidget(
          title: 'Find Me', onFilterSubmitted: _handleFilterSubmitted),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchFieldWidget(cntrl: _searchController),
                
                FutureBuilder<List<ProductModel>>(future: _productApiCall.searchProductsWithFilter(ProductFilter(name: widget.req?.name,colors: widget.req?.colors,sortBy: widget.req?.sortBy, sortOrder: widget.req?.sortOrder,region: widget.req?.region,size: widget.req?.size)),
                 builder: (context, snapshot) {
                  if(snapshot.hasData){
                    nb= snapshot.data?.length;
                    
                    return Column(
                      children: [
                        Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          child: const Icon(
                            CupertinoIcons.arrow_left,
                            size: 20,
                            color: Color(0xFFDF9A4F),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text("  ${nb} Results Found",
                            style: TextStyle(
                              color: Color(0xFFDF9A4F),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ))
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          requette = ProductFilter(
                              name: _searchController.text,
                              size: requette?.size,
                              colors: requette?.colors,
                              sortBy: requette?.sortBy,
                              sortOrder: requette?.sortOrder,
                              region: requette?.region);
                          //name: textValue,
                          Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    SearchPage(req: requette),
                              ));
                        },
                        icon: Icon(
                          CupertinoIcons.arrow_2_circlepath,
                          size: 25,
                        ))
                  ],
                ),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder:(context, index) => Container(
                            color: const Color.fromARGB(255, 125, 195, 252),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text(snapshot.data![index].name),
                                  subtitle: Text("${snapshot.data![index].price}"),
                                )
                              ],
                            ),
                          ) ,
                          separatorBuilder: (context, index) => const SizedBox(height: 10,), ),
                      ],
                    );
                  }
                  else {
            return Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width*0.7,),
                const  Center(
                  child: CircularProgressIndicator(), // Display loading indicator
                ),
              ],
            );
          }
                  
                },),
                Text("name: ${widget.req?.name}"),
                Text("size:${widget.req?.size}"),
                Text("colors: ${widget.req?.colors}"),
                Text("sortBy: ${widget.req?.sortBy}"),
                Text("sortOrder: ${widget.req?.sortOrder}"),
                Text("region: ${widget.req?.region}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
