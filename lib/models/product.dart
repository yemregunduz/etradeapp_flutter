class Product{
  late int id;
  late String productName;
  late String description;
  late double unitPrice;

  Product(this.productName, this.description, this.unitPrice);

  Product.withId(this.id,this.productName, this.description, this.unitPrice);

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    map["productName"] = productName;
    map["description"] = description;
    map["unitPrice"] = unitPrice;
    if(id!=null){
      map["id"] = id;
    }
    return map;
  }
  Product.fromObject(dynamic object){
    this.id = int.parse(object["id"]);
    this.productName = object["productName"];
    this.description = object["description"];
    this.unitPrice = double.parse(object["unitPrice"]);
  }
}