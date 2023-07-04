import 'package:flutter/material.dart';
import 'package:my_anime_app/models/anime.dart';
import 'package:my_anime_app/screens/anime_screen.dart';
import 'package:my_anime_app/services/anime_service.dart';

class Seeall extends StatefulWidget {
  const Seeall({Key? key});

  @override
  _Seeall createState() => _Seeall();
}

class _Seeall extends State<Seeall> {
  final ProductService productService = ProductService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 54, 4, 119),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          'All Animes',
          style: TextStyle(
            color: Color.fromARGB(255, 246, 255, 0),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            FutureBuilder<List<Anime>>(
              future: productService.getAnime(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Anime>> snapshot) {
                if (snapshot.hasData) {
                  List<Anime> products = snapshot.data!;
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
                      Anime product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
                        },
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
                          color: Color.fromARGB(255, 246, 255, 0),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Loading...',
                          style: TextStyle(
                            color: Color.fromARGB(255, 246, 255, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
