import 'package:flutter/material.dart';
import 'package:formation_flutter/l10n/app_localizations.dart';
import 'package:formation_flutter/model/product.dart';
import 'package:formation_flutter/res/app_colors.dart';
import 'package:formation_flutter/res/app_icons.dart';
import 'package:formation_flutter/res/app_theme_extension.dart';
import 'package:provider/provider.dart';

Product generateFakeProduct() {
  return Product(
    barcode: '123456789',
    name: 'Nutella',
    brands: ['Ferrero'],
    picture: 'https://images.openfoodfacts.org/images/products/301/762/042/5035/front_fr.533.400.jpg',
    quantity: '200g',
    nutriScore: ProductNutriScore.E,
    novaScore: ProductNovaScore.group4,
    greenScore: ProductGreenScore.D,
    manufacturingCountries: ['France', 'Italie'],
  );
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductManager(),
      child: Scaffold(
        body: Consumer<ProductManager>(
          builder: (context, manager, child) {
            final product = manager.product;

            if (product == null) {
              return const ProductLoading();
            }

            return Provider.value(
              value: product,
              child: const ProductContent(),
            );
          },
        ),
      ),
    );
  }
}

class ProductManager extends ChangeNotifier {
  Product? _product;

  Product? get product => _product;

  ProductManager() {
    loadProduct();
  }

  void loadProduct() {
    Future.delayed(const Duration(seconds: 2), () {
      _product = generateFakeProduct();
      notifyListeners();
    });
  }
}

class ProductLoading extends StatelessWidget {
  const ProductLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ProductContent extends StatelessWidget {
  const ProductContent({super.key});

  static const double IMAGE_HEIGHT = 300.0;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return SizedBox.expand(
      child: Stack(
        children: [
          PositionedDirectional(
            top: 0.0,
            start: 0.0,
            end: 0.0,
            height: IMAGE_HEIGHT,
            child: product.picture != null
                ? Image.network(
                    product.picture!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        Container(color: Colors.grey),
                  )
                : Container(color: Colors.grey),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          PositionedDirectional(
            top: IMAGE_HEIGHT - 16.0,
            start: 0.0,
            end: 0.0,
            bottom: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.0),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20.0,
                vertical: 30.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _ProductName(),
                    const _ProductBrand(),
                    const SizedBox(height: 20.0),
                    const Scores(),
                    const SizedBox(height: 20.0),
                    const _ProductAttributes(),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductName extends StatelessWidget {
  const _ProductName();

  @override
  Widget build(BuildContext context) {
    final name = Provider.of<Product>(context).name ?? 'Nom inconnu';
    
    return Text(
      name,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF0D3B66),
            fontWeight: FontWeight.bold,
          ) ?? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0D3B66)),
    );
  }
}

class _ProductBrand extends StatelessWidget {
  const _ProductBrand();

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<Product>(context).brands;
    final brandText = (brands != null && brands.isNotEmpty) ? brands.first : '';
    
    return Text(
      brandText,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }
}

class Scores extends StatelessWidget {
  const Scores({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
           decoration: BoxDecoration(
            color: const Color(0xFFF6F6F8),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 44, child: _Nutriscore()),
                const VerticalDivider(),
                const Expanded(flex: 56, child: _NovaGroup()),
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
          child: const _GreenScore(),
        ),
      ],
    );
  }
}

class _Nutriscore extends StatelessWidget {
  const _Nutriscore();

  @override
  Widget build(BuildContext context) {
    final nutriscore = Provider.of<Product>(context).nutriScore ?? ProductNutriScore.unknown;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.nutriscore,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0D3B66)),
        ),
        const SizedBox(height: 5.0),
        Image.asset(_findAssetName(nutriscore), height: 42.0),
      ],
    );
  }

  String _findAssetName(ProductNutriScore nutriscore) {
    return switch (nutriscore) {
      ProductNutriScore.A => 'res/drawables/nutriscore_a.png',
      ProductNutriScore.B => 'res/drawables/nutriscore_b.png',
      ProductNutriScore.C => 'res/drawables/nutriscore_c.png',
      ProductNutriScore.D => 'res/drawables/nutriscore_d.png',
      ProductNutriScore.E => 'res/drawables/nutriscore_e.png',
      ProductNutriScore.unknown => 'res/drawables/nutriscore_e.png',
    };
  }
}

class _NovaGroup extends StatelessWidget {
  const _NovaGroup();

  @override
  Widget build(BuildContext context) {
    final novaScore = Provider.of<Product>(context).novaScore ?? ProductNovaScore.unknown;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.nova_group,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0D3B66)),
        ),
        const SizedBox(height: 5.0),
        Text(_findLabel(novaScore), style: const TextStyle(color: AppColors.grey2)),
      ],
    );
  }

  String _findLabel(ProductNovaScore novaScore) {
    return switch (novaScore) {
      ProductNovaScore.group1 => 'Aliments non transformés ou transformés minimalement',
      ProductNovaScore.group2 => 'Ingrédients culinaires transformés',
      ProductNovaScore.group3 => 'Aliments transformés',
      ProductNovaScore.group4 => 'Produits alimentaires et boissons ultra-transformés',
      ProductNovaScore.unknown => 'Score non calculé',
    };
  }
}

class _GreenScore extends StatelessWidget {
  const _GreenScore();

  @override
  Widget build(BuildContext context) {
    final greenScore = Provider.of<Product>(context).greenScore ?? ProductGreenScore.unknown;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.greenscore,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0D3B66)),
        ),
        const SizedBox(height: 5.0),
        Row(
          children: <Widget>[
            Icon(_findIcon(greenScore), color: _findIconColor(greenScore)),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                _findLabel(greenScore),
                style: const TextStyle(color: AppColors.grey2),
              ),
            ),
          ],
        ),
      ],
    );
  }

  IconData _findIcon(ProductGreenScore greenScore) {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppIcons.ecoscore_a_plus,
      ProductGreenScore.A => AppIcons.ecoscore_a,
      ProductGreenScore.B => AppIcons.ecoscore_b,
      ProductGreenScore.C => AppIcons.ecoscore_c,
      ProductGreenScore.D => AppIcons.ecoscore_d,
      ProductGreenScore.E => AppIcons.ecoscore_e,
      ProductGreenScore.F => AppIcons.ecoscore_f,
      ProductGreenScore.unknown => AppIcons.ecoscore_e,
    };
  }

  Color _findIconColor(ProductGreenScore greenScore) {
    return switch (greenScore) {
      ProductGreenScore.APlus => AppColors.greenScoreAPlus,
      ProductGreenScore.A => AppColors.greenScoreA,
      ProductGreenScore.B => AppColors.greenScoreB,
      ProductGreenScore.C => AppColors.greenScoreC,
      ProductGreenScore.D => AppColors.greenScoreD,
      ProductGreenScore.E => AppColors.greenScoreE,
      ProductGreenScore.F => AppColors.greenScoreF,
      ProductGreenScore.unknown => Colors.grey,
    };
  }

  String _findLabel(ProductGreenScore greenScore) {
    return switch (greenScore) {
      ProductGreenScore.APlus => 'Très faible impact environnemental',
      ProductGreenScore.A => 'Très faible impact environnemental',
      ProductGreenScore.B => 'Faible impact environnemental',
      ProductGreenScore.C => "Impact modéré sur l'environnement",
      ProductGreenScore.D => 'Impact environnemental élevé',
      ProductGreenScore.E => 'Impact environnemental très élevé',
      ProductGreenScore.F => 'Impact environnemental très élevé',
      ProductGreenScore.unknown => 'Score non calculé',
    };
  }
}

class _ProductAttributes extends StatelessWidget {
  const _ProductAttributes();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    
    String countryText = 'Non spécifié';
    if (product.manufacturingCountries != null && product.manufacturingCountries!.isNotEmpty) {
      countryText = product.manufacturingCountries!.first;
    }

    return Column(
      children: [
        ProductAttribute(
          label: 'Quantité',
          value: product.quantity ?? 'Non spécifiée',
        ),
        ProductAttribute(
          label: 'Vendu',
          value: countryText,
          hasSeparator: false,
        ),
      ],
    );
  }
}

class ProductAttribute extends StatelessWidget {
  final String label;
  final String value;
  final bool hasSeparator;

  const ProductAttribute({
    super.key,
    required this.label,
    required this.value,
    this.hasSeparator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  label,
                  style: const TextStyle(color: Color(0xFF0D3B66), fontWeight: FontWeight.w600, fontSize: 17.0),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: const TextStyle(color: Colors.grey, fontSize: 17.0),
                ),
              ),
            ],
          ),
        ),
        if (hasSeparator)
          Container(height: 1.0, color: Colors.grey.withOpacity(0.2)),
      ],
    );
  }
}