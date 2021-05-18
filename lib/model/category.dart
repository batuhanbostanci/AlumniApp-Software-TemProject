import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final int categoryId;
  final String name;
  final IconData icon;

  Category({this.categoryId, this.name, this.icon});
}

final allCategory = Category(
  categoryId: 0,
  name: "All",
  icon: Icons.search,
);

final musicCategory = Category(
  categoryId: 1,
  name: "Events",
  icon: Icons.event,
);

final meetUpCategory = Category(
  categoryId: 2,
  name: "For Alumni",
  icon: Icons.event_available_outlined,
);

final golfCategory = Category(
  categoryId: 3,
  name: "Seminars",
  icon: Icons.announcement_outlined,
);

final jobCategory= Category(
  categoryId: 4,
  name: " Jobs",
  icon: Icons.work
);

final categories = [
  allCategory,
  musicCategory,
  meetUpCategory,
  golfCategory,
  jobCategory,
];
