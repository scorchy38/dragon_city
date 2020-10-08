import 'package:flutterdragoncity/widgets/homepage/explore_items.dart';
import 'package:flutterdragoncity/widgets/homepage/service_item.dart';
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

  List<ExploreItem> exploreItems = [

    ExploreItem(
      id: '1',
      vectorPath: 'assets/vectors/explore_vect/electronics.png',
        label : 'Electronics'
    ),
    ExploreItem(
      id: '2',
      vectorPath: 'assets/vectors/explore_vect/home_fur.png',
        label : 'Home Furniture'
    ),
    ExploreItem(
      id: '3',
      vectorPath: 'assets/vectors/explore_vect/lightening.png',
        label : 'Lightening'
    ),
    ExploreItem(
      id: '4',
      vectorPath: 'assets/vectors/explore_vect/furniture.png',
        label : 'Furniture'
    ),
    ExploreItem(
      id: '5',
      vectorPath: 'assets/vectors/explore_vect/toys.png',
        label : 'Toys'
    )
  ];

  List<ServiceItem> serviceItems = [

    ServiceItem(
      id: '1',
      vectorPath: 'assets/vectors/services_vect/bank.png',
      label : 'Bank'
    ),
    ServiceItem(
      id: '2',
      vectorPath: 'assets/vectors/services_vect/atm.png',
        label : 'ATM'
    ),
    ServiceItem(
      id: '3',
      vectorPath: 'assets/vectors/services_vect/info.png',
        label : 'Information'
    ),
    ServiceItem(
      id: '4',
      vectorPath: 'assets/vectors/services_vect/mosque.png',
        label : 'Mosque'
    ),
    ServiceItem(
      id: '5',
      vectorPath: 'assets/vectors/services_vect/male_restroom.png',
        label : 'Male Restroom'
    ),
    ServiceItem(
      id: '6',
      vectorPath: 'assets/vectors/services_vect/female_restroom.png',
        label : 'Female Restroom'
    )
  ];

}