import 'package:json_annotation/json_annotation.dart';
import 'package:formation_flutter/model/product.dart';

part 'product_api.g.dart';

@JsonSerializable()
class ProductAPIEntity {
  ProductAPIEntity(this.response, this.error);

  factory ProductAPIEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductAPIEntityFromJson(json);

  
  @JsonKey(name: 'response')
  ProductAPIResponseEntity? response;
  
  dynamic error;

  Map<String, dynamic> toJson() => _$ProductAPIEntityToJson(this);
}

@JsonSerializable()
class ProductAPIResponseEntity {
  ProductAPIResponseEntity(
    this.name,
    this.altName,
    this.barcode,
    this.pictures,
    this.quantity,
    this.brands,
    this.stores,
    this.countries,
    this.manufacturingCountries,
    this.nutriScore,
    this.novaScore,
    this.ecoScore,
    this.ecoScoreGrade,
    this.nutritionScore,
    this.ingredients,
    this.nutrientLevels,
    this.nutritionFacts,
    this.traces,
    this.additives,
    this.allergens,
    this.packaging,
    this.analysis,
  );

  factory ProductAPIResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductAPIResponseEntityFromJson(json);
  
  @JsonKey(name: 'product_name')
  String? name;
  String? altName;
  
  @JsonKey(name: 'code')
  String? barcode;
  
  ProductAPIResponsePicturesEntity? pictures;
  
  
  @JsonKey(name: 'image_front_url')
  String? imageFrontUrl; 

  String? quantity;
  List<String>? brands;
  List<String>? stores;
  List<String>? countries;
  
  @JsonKey(name: 'countries_tags')
  List<String>? manufacturingCountries;
  
  @JsonKey(name: 'nutriscore_grade')
  String? nutriScore;
  
  @JsonKey(name: 'nova_group')
  int? novaScore;
  
  int? ecoScore;
  
  @JsonKey(name: 'ecoscore_grade')
  String? ecoScoreGrade;
  
  int? nutritionScore;
  
  ProductAPIResponseIngredientsEntity? ingredients;
  ProductAPIResponseNutrientLevelsEntity? nutrientLevels;
  ProductAPIResponseNutritionFacts? nutritionFacts;
  ProductAPIResponseTracesEntity? traces;
  Map<String, String>? additives;
  ProductAPIResponseAllergensEntity? allergens;
  List<String>? packaging;
  ProductAPIResponseAnalysisEntity? analysis;

  Map<String, dynamic> toJson() => _$ProductAPIResponseEntityToJson(this);

  Product toProduct() => Product(
    barcode: barcode ?? '',
    name: name ?? 'Nom inconnu',
    
    picture: pictures?.front ?? imageFrontUrl, 
    quantity: quantity,
    brands: brands,
    manufacturingCountries: manufacturingCountries,
    nutriScore: switch (nutriScore?.toUpperCase()) {
      'A' => ProductNutriScore.A,
      'B' => ProductNutriScore.B,
      'C' => ProductNutriScore.C,
      'D' => ProductNutriScore.D,
      'E' => ProductNutriScore.E,
      _ => ProductNutriScore.unknown,
    },
    novaScore: switch (novaScore) {
      1 => ProductNovaScore.group1,
      2 => ProductNovaScore.group2,
      3 => ProductNovaScore.group3,
      4 => ProductNovaScore.group4,
      _ => ProductNovaScore.unknown,
    },
    greenScore: switch (ecoScoreGrade?.toLowerCase()) {
      'a' => ProductGreenScore.A,
      'b' => ProductGreenScore.B,
      'c' => ProductGreenScore.C,
      'd' => ProductGreenScore.D,
      'e' => ProductGreenScore.E,
      'f' => ProductGreenScore.F,
      _ => ProductGreenScore.unknown,
    },
  );
}

@JsonSerializable()
class ProductAPIResponsePicturesEntity {
  ProductAPIResponsePicturesEntity(
    this.product,
    this.front,
    this.ingredients,
    this.nutrition,
  );

  factory ProductAPIResponsePicturesEntity.fromJson(
    Map<String, dynamic> json,
  ) => _$ProductAPIResponsePicturesEntityFromJson(json);
  
  String? product;
  String? front;
  String? ingredients;
  String? nutrition;

  Map<String, dynamic> toJson() =>
      _$ProductAPIResponsePicturesEntityToJson(this);
}


@JsonSerializable()
class ProductAPIResponseIngredientsEntity {
  ProductAPIResponseIngredientsEntity(this.list);
  factory ProductAPIResponseIngredientsEntity.fromJson(Map<String, dynamic> json) => _$ProductAPIResponseIngredientsEntityFromJson(json);
  List<String>? list;
  Map<String, dynamic> toJson() => _$ProductAPIResponseIngredientsEntityToJson(this);
}
@JsonSerializable()
class ProductAPIResponseNutrientLevelsEntity {
  ProductAPIResponseNutrientLevelsEntity();
  factory ProductAPIResponseNutrientLevelsEntity.fromJson(Map<String, dynamic> json) => _$ProductAPIResponseNutrientLevelsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProductAPIResponseNutrientLevelsEntityToJson(this);
}
@JsonSerializable()
class ProductAPIResponseNutritionFacts {
  ProductAPIResponseNutritionFacts();
  factory ProductAPIResponseNutritionFacts.fromJson(Map<String, dynamic> json) => _$ProductAPIResponseNutritionFactsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductAPIResponseNutritionFactsToJson(this);
}
@JsonSerializable()
class ProductAPIResponseTracesEntity {
  ProductAPIResponseTracesEntity(this.list);
  factory ProductAPIResponseTracesEntity.fromJson(Map<String, dynamic> json) => _$ProductAPIResponseTracesEntityFromJson(json);
  List<String>? list;
  Map<String, dynamic> toJson() => _$ProductAPIResponseTracesEntityToJson(this);
}
@JsonSerializable()
class ProductAPIResponseAllergensEntity {
  ProductAPIResponseAllergensEntity(this.list);
  factory ProductAPIResponseAllergensEntity.fromJson(Map<String, dynamic> json) => _$ProductAPIResponseAllergensEntityFromJson(json);
  List<String>? list;
  Map<String, dynamic> toJson() => _$ProductAPIResponseAllergensEntityToJson(this);
}
@JsonSerializable()
class ProductAPIResponseAnalysisEntity {
  ProductAPIResponseAnalysisEntity();
  factory ProductAPIResponseAnalysisEntity.fromJson(Map<String, dynamic> json) => _$ProductAPIResponseAnalysisEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProductAPIResponseAnalysisEntityToJson(this);
}