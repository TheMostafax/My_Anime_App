import 'package:flutter/material.dart';
import 'package:my_anime_app/models/categorym.dart';
import 'package:my_anime_app/services/category_service.dart';

class Categorypage extends StatefulWidget {
  @override
  _Categorypage createState() => _Categorypage();
}

class _Categorypage extends State<Categorypage> {
  List<String> _images = [
    'assets/action.png',
    'assets/comedy.png',
    'assets/drama.png',
    'assets/romance.png',
    'assets/sports.png',
  ];
  final List<String> textt = [
    'Action',
    'Comedy',
    'Drama',
    'Romance',
    'Sports',
  ];
  int index = 0;
  final CategoryService productService = CategoryService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text(
          'Categories',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: FutureBuilder<List<Category>>(
          future: productService.getCategory(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if (snapshot.hasData) {
              List<Category> products = snapshot.data!;

              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.9,
                ),
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  Category product = products[index];
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: GridTile(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Image.asset(
                            product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        footer: GridTileBar(
                          backgroundColor: Colors.black54,
                          title: Text(
                            product.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      color: Colors.white,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Loading...',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
