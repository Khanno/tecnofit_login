import 'package:flutter/material.dart';
import 'package:tecnofit_login/models/drawer_item.dart';

final List<DrawerItemModel> drawerItemList = [
  DrawerItemModel(
    icon: Icon(Icons.home),
    route: '/dashboard',
    text: 'Inicio'
  ),
  DrawerItemModel(
    icon: Icon(Icons.person),
    route: '/profile',
    text: 'Perfil'
  ),
];