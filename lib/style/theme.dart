import 'package:flutter/material.dart';

final theme = Theme(
  // Create a unique theme with "ThemeData"
  data: ThemeData(
    accentColor: Colors.yellow,
  ),
  child: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
);
