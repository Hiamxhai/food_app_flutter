class Product {
  String? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel>? _product;
  List<ProductModel> get products => _product!;

  Productt({required totalSize, required typeId,
    required offset, required product}) {
    this._totalSize = _totalSize;
    this._typeId=_typeId;
    this._offset=_offset;
    this._product = _product;

  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeId = json['type_id'];
    _offset = json['offset'];
    if (json['products'] != null) {
      _product = <ProductModel>[];
      json['products'].forEach((v) {
        _product!.add(new ProductModel.fromJson(v));
      });
    }
  }


}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? img;
  String? location;
  String? createdAt;
  int? typeId;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.typeId});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    location = json['location'];
    createdAt = json['created_at'];
    typeId = json['type_id'];
  }



}