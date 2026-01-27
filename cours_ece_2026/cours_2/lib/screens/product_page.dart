import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  height: 300,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                

                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.share, color: Colors.white),
                    onPressed: () {},
                  ),
                ),

                Positioned.fill(
                  top: 280,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16.0),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Text(
                            'Petits pois et carottes',
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0D3B66),
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            'Cassegrain',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 20.0),

                          
                       
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F8), 
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                            child: IntrinsicHeight( 
                              child: Row(
                                children: [
                                  
                                  Expanded(
                                    flex: 44,
                                    child: ProductNutriscore(),
                                  ),
                                  
                                  
                                  const ProductInfoSeparator(axis: Axis.vertical),
                                  
                                  
                                  Expanded(
                                    flex: 56,
                                    child: ProductNovaScore(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          

                          const SizedBox(height: 10.0),
                          Container(
                             decoration: BoxDecoration(
                              color: const Color(0xFFF6F6F8), 
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            padding: const EdgeInsets.all(15.0),
                            child: const ProductEcoScore(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductInfoSeparator extends StatelessWidget {
  final Axis axis;

  const ProductInfoSeparator({super.key, required this.axis});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: axis == Axis.vertical ? 1.0 : double.infinity,
      height: axis == Axis.vertical ? double.infinity : 1.0,
      color: Colors.grey.withOpacity(0.3),
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
    );
  }
}


class ProductNutriscore extends StatelessWidget {
  const ProductNutriscore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Nutri-Score',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Color(0xFF0D3B66),
          ),
        ),
        const SizedBox(height: 5.0),
        
        Image.network(
          'https://static.openfoodfacts.org/images/misc/nutriscore-a.png',
          height: 50.0, 
          fit: BoxFit.contain,
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}


class ProductNovaScore extends StatelessWidget {
  const ProductNovaScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Groupe NOVA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Color(0xFF0D3B66),
          ),
        ),
        const SizedBox(height: 5.0),
        const Text(
          'Produits alimentaires et boissons ultra-transformés',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}


class ProductEcoScore extends StatelessWidget {
  const ProductEcoScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'EcoScore',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Color(0xFF0D3B66),
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            const Icon(Icons.eco, color: Colors.green), 
            const SizedBox(width: 8.0),
            Expanded(
              child: const Text(
                'Impact environnemental faible',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ],
    );
  }
}