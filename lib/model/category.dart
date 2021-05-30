import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final haberlerCategory = Category(
 categoryId: 0,
  name: "News",
 icon: Icons.animation,
);

final musicCategory = Category(
  categoryId: 1,
  name: "Interviews",
  icon: Icons.mic,
);



final jobCategory= Category(
 categoryId: 4,
 name: " Jobs",
 icon: Icons.work
);

final categories = [
  haberlerCategory,
  musicCategory,

  //jobCategory,
];
final categories_logged = [
  haberlerCategory,
  musicCategory,
  jobCategory

];
