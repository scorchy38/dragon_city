import 'package:flutterdragoncity/widgets/homepage/explore_items.dart';
import 'package:flutterdragoncity/widgets/homepage/service_item.dart';
import 'package:flutterdragoncity/widgets/location/search_item.dart';
import 'package:flutterdragoncity/widgets/shop_widget.dart';

class DummyWigetsData {


  List<ShopViewWidget> shops = [
    ShopViewWidget(
      imagePath: 'assets/images/shop_toys.png',
      shopTitle: 'Toys',
      numbers: '183',
    ),
    ShopViewWidget(
      imagePath: 'assets/images/shop_kitchen.png',
      shopTitle: 'Kitchen',
      numbers: '165',
    ),
    ShopViewWidget(
      imagePath: 'assets/images/shop_carpet.png',
      shopTitle: 'Carpet',
      numbers: '209',
    ),
    ShopViewWidget(
      imagePath: 'assets/images/shop_kitchen.png',
      shopTitle: 'Grill',
      numbers: '183',
    ),
  ];



  List<SearchItem> searchItems = [

    SearchItem(
      id: 1,
       title: 'Asna Home Decoration',
      imagePath: 'assets/images/shop_toys.png',
      category: 'Toys',
      steps: '135',
      time: '15 ',
    ),
    SearchItem(
      id: 2,
      title: 'Asna Home Decoration',
      imagePath: 'assets/images/shop_kitchen.png',
      category: 'Food',
      steps: '135',
      time: '15 ',
    ),
    SearchItem(
      id: 3,
      title: 'Asna Home Decoration',
      imagePath: 'assets/images/shop_toys.png',
      category: 'Bags',
      steps: '135',
      time: '15 ',
    ),
    SearchItem(
      id: 4,
      title: 'Asna Home Decoration',
      imagePath: 'assets/images/shop_carpet.png',
      category: 'Carpet',
      steps: '135',
      time: '15',

    ),
  ];


}