
import 'package:pizza_app/utils/model/macro.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PezzaModel {
  String? pezzaId;
  String? picture;
  bool? isVeg;
  int? spicy;
  String? name;
  String? description;
  int? price;
  int? discount;
  MacroModel? macros;
  PezzaModel({
    this.pezzaId,
    this.picture,
    this.isVeg,
    this.spicy,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.macros,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pezzaId': pezzaId,
      'picture': picture,
      'isVeg': isVeg,
      'spicy': spicy,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'macros': macros,
    };
  }

  factory PezzaModel.fromMap(Map<String, dynamic> json) {
    return PezzaModel(
      pezzaId: json['pezzaId'],
      picture: json['picture'],
      isVeg: json['isVeg'],
      spicy: json['spicy'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      discount: json['discount'],
      macros: MacroModel.fromMap(json['macros']),
    );
  }


}
