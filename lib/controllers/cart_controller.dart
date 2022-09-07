import 'package:flutter/material.dart';
import 'package:foodapp_heii/models/products_model.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../utils/color.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;


  void addItem(ProductModel product, int  quantity) {
    var totalQuantity = 0;
      // print('length of the item is ' + _items.length.toString());
    if(_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return  CartModel(
          id : value.id,
          name: value.name,
          price : value.price,
          img : value.img,
          quantity: value.quantity! + quantity,
          isExist : true,
          time: DateTime.now().toString(),
        );
      });
    } else {
      if(quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          print('adding item to the cart' +
              product.id!.toString() + 'quantity ' + quantity.toString());
          _items.forEach((key, value) {
            print('quantitu is ' + value.quantity.toString());
          });
          return CartModel(
            id : product.id,
            name: product.name,
            price : product.price,
            img : product.img,
            quantity: quantity,
            isExist : true,
            time: DateTime.now().toString(),
          );}
        );
        if (totalQuantity <= 0 ) {
          _items.remove(product.id);
        }
      } else {
        Get.snackbar("Item count",
            "You should at least add in item in the card!",
            backgroundColor: AppColors.mainColor,
            colorText:  Colors.white
        );
      }
    }
    


  }

  bool exitInCart(ProductModel product) {
    if(_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {

    var quantity = 0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

    int get totalItems {
      var totalQuantity = 0;
      _items.forEach((key, value) {
        totalQuantity  += value.quantity!;
      });
      return totalQuantity;
    }

    List<CartModel> get getItems {
      return _items.entries.map((e) {
        return e.value;
      }).toList();
    }



}