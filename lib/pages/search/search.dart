import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../product_detail.dart';

class Searcpages extends StatefulWidget {
  const Searcpages({super.key});

  @override
  State<Searcpages> createState() => _SearcpagesState();
}

class _SearcpagesState extends State<Searcpages> {
  List products = [];

  List productdetail = [];




  // API se products lana
  void fetchProduct() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      setState(() {
        productdetail = data;
        products = data;
      });
    }
  }

  // initState yahan hona chahiye
  @override
  void initState() {
    super.initState();
    fetchProduct();
  }
 void Searchpages(String searchvalues){

    setState(() {

    });
    if (searchvalues.isEmpty){
      products = productdetail;
    }
    else{
      products=productdetail.where((product){
        final title = product['title'].toString().toLowerCase();
        return title.contains(searchvalues.toLowerCase());
      }).toList();
    }



 }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,

          ),
        ),

        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // SEARCH FIELD
            TextField(
              onChanged:Searchpages,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search_outlined),
                border: OutlineInputBorder(),
                hintText: "Search.....",
              ),
            ),

            const SizedBox(height: 20),

            // PRODUCTS
            Expanded(
              child: GridView.builder(
                itemCount: products.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.67,
                ),

                itemBuilder: (context, index) {
                  final product = products[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    clipBehavior: Clip.antiAlias,

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        // PRODUCT IMAGE
                        Expanded(
                          child: Image.network(
                            product['image'],
                            width: double.infinity,
                            fit: BoxFit.contain,
                          ),
                        ),

                        // PRODUCT DETAILS
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            12,
                            11,
                            10,
                            12,
                          ),

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [

                              Text(
                                product['title'],
                                maxLines: 1,
                                overflow:
                                TextOverflow.ellipsis,

                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              const SizedBox(height: 9),

                              Row(
                                children: [

                                  Expanded(
                                    child: Text(
                                      "Rs ${product['price']}",

                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                        FontWeight.w800,
                                        color:
                                        Colors.deepOrange,
                                      ),
                                    ),
                                  ),

                                  SizedBox(
                                    height: 34,

                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,

                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ProductDetailPage(
                                                  productsDetail:
                                                  product,
                                                ),
                                          ),
                                        );
                                      },

                                      child:
                                      const Text("View"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}