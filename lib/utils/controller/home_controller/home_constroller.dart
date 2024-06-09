import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pizza_app/utils/model/pizza_model.dart';

class HomeController extends ChangeNotifier{
  Future<void> logOut()async {
    return await FirebaseAuth.instance.signOut();
  }
  List<PezzaModel>? pezzaModel;
  Future<List<PezzaModel>?> getPizza()async {
    var pizzas = await FirebaseFirestore.instance.collection('pizzas').get();
     return pizzas.docs.map((e) => PezzaModel.fromMap(e.data())).toList(); 
    // pizzas.docs.map((e) => PezzaModel.fromMap(e.data()));
    // print(pizzas.docs);
  }
}