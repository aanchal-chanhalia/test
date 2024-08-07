class Model{
  int? id;
  String? foodName;
  double? price;

  Model({
    this.id,
    this.foodName,
    this.price
  });
  Map<String, dynamic>toMap(){
    return{
    "id":id,
    "foodName":foodName,
    "price":price
    };
    
  }
  factory Model.fromJson(Map<String,dynamic>josn){
    return Model(
      id: josn['id'],
      foodName: josn['foodName'],
      price: josn['price']
    );
  }
}