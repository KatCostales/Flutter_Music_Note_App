import 'package:pitchupfluttersample/app/ui/core/header_item_uim.dart';
import 'package:flutter/material.dart';

final itemsPage = [
  HeaderItemUIModel(
      id: 0, 
      title: 'User Profile',
      route: '/profile', 
      icon: Icons.login,
      ),
  HeaderItemUIModel(
    id: 1,
    title: 'Tools',
    route: '/tools',
    icon: Icons.abc_sharp,
  ),
  HeaderItemUIModel(
    id: 2,
    title: 'About',
    route: '/about',
    icon: Icons.account_box_outlined,
  ),
  HeaderItemUIModel(
      id: 3,
      title: 'Contact',
      route: '/contact',
      icon: Icons.contact_page_sharp),
  HeaderItemUIModel(
    id: 4,
    title: 'Solutions',
    route: '/solutions',
    icon: Icons.location_on,
  ),
  HeaderItemUIModel(
    id: 5,
    title: 'Home',
    route: '/home',
    isSelected: true,
    icon: Icons.home,
  ),
];
