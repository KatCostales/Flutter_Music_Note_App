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
    title: 'Flashcards',
    route: '/tools',
    icon: Icons.square_foot_rounded,
  ),
  HeaderItemUIModel(
    id: 3,
    title: 'Home',
    route: '/home',
    isSelected: true,
    icon: Icons.home,
  ),
  HeaderItemUIModel(
    id: 4,
    title: 'About',
    route: '/about',
    icon: Icons.account_box_outlined,
  ),
  HeaderItemUIModel(
      id: 5,
      title: 'Contact',
      route: '/contact',
      icon: Icons.contact_page_sharp),

  
];
