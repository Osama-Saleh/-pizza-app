class MacroModel {
  int? calorirs;
  int? protiens;
  int? fat;
  int? carbs;
  MacroModel({
    this.calorirs,
    this.protiens,
    this.fat,
    this.carbs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calorirs': calorirs,
      'protiens': protiens,
      'fat': fat,
      'carbs': carbs,
    };
  }

  factory MacroModel.fromMap(Map<String, dynamic> map) {
    return MacroModel(
        calorirs: map['calorirs'],
        protiens: map['protiens'],
        fat: map['fat'],
        carbs: map['carbs']);
  }
}
