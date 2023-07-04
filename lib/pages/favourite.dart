import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_anime_app/services/anime_service.dart';
import 'package:my_anime_app/models/anime.dart';
import 'package:my_anime_app/screens/anime_screen.dart';

class Favourite extends StatefulWidget {
  @override
  _Favourite createState() => _Favourite();
}

class _Favourite extends State<Favourite> {
  final List<Anime> _favoriteProducts = [];
  final ProductService productService = ProductService();

  String _sortingOption = 'Category';
  List<Anime> _products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  void _getProducts() async {
    List<Anime> products = await productService.getAnime();
    setState(() {
      _products = products;
    });
  }

  void _sortProducts() {
    switch (_sortingOption) {
      case 'Category':
        _products.sort((a, b) => a.genre.compareTo(b.genre));
        break;
      case 'Rating':
        _products.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case 'Name':
        _products.sort((a, b) => a.title.compareTo(b.title));
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        title: Text('Your Favorite List'),
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              setState(() {
                _sortingOption = value;
                _sortProducts();
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'Category',
                child: Text('Sort by category'),
              ),
              PopupMenuItem(
                value: 'Rating',
                child: Text('Sort by rating'),
              ),
              PopupMenuItem(
                value: 'Name',
                child: Text('Sort by name'),
              ),
            ],
          ),
        ],
      ),
      body: _products.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ],
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _products.length,
              itemBuilder: (BuildContext context, int index) {
                Anime product = _products[index];
                bool isFavorite = _favoriteProducts.contains(product);
                return Card(
                  color: Color.fromARGB(255, 54, 4, 119),
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailScreen(product: product),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(4)),
                            child: Image.asset(
                              product.image,
                              fit: BoxFit.cover,
                              height: 150,
                              width: 160,
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        product.title,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Color.fromARGB(255, 251, 255, 0),
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (isFavorite) {
                                              _favoriteProducts.remove(product);
                                            } else {
                                              _favoriteProducts.add(product);
                                            }
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: Colors.white, width: 2),
                                          ),
                                          child: Icon(
                                            Icons.favorite,
                                            color: isFavorite
                                                ? Colors.red
                                                : Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Category: ${product.genre}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 16,
                                      ),
                                      Text(
                                        'Rating: ${product.rating}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
