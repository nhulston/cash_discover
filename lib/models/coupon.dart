class Coupon {
  String merchantName;
  String couponCode;
  String description;
  DateTime expiration;
  String image;

  Coupon(
    this.merchantName,
    this.couponCode,
    this.description,
    this.expiration,
    this.image,
  );

  static List<Coupon> coupons = [
    Coupon('Brick Pizza', 'PIZZA', '10% Off All Pizzas', DateTime(2022, 8, 15), 'pay.jpg'),
    Coupon('Sunny Skates', 'SUNNY', '\$15 Off Any Board', DateTime(2022, 7, 30), 'pay.jpg'),
    Coupon('Vintage Fashion', 'VINTAGE', '15% Off Any Order', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Urban Exchange', 'XCHANGE', '\$5 Off Any T-Shirt', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('All Halal', 'HALAL', 'Free Dessert', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Fresh Cuts', 'STAYFRESH', '\$5 Off Any Cut', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Salad Palace', 'FRESH', '\$5 Off Any Salad', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Burger Stop', 'FRIES', '20% Off Any Order', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Super Spa', 'SUPER', '\$10 Off Any Massage', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Rick''s Climbing', 'CLIMB', 'Kids Climb Free', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Coffee Spot', 'TEA', '\$3 Off Any Iced Tea', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Bagels n\' Brunch', 'BRUNCH', 'Free Fruit', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Avocado Shop', 'BOWL', '\$5 Off Any Bowl', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Ramen Truck', 'SUSHI', '10% Off All Sushis', DateTime(2022, 10, 8), 'pay.jpg'),
    Coupon('Frozen Custard', 'FROZEN', '1 Scoop Free', DateTime(2022, 10, 8), 'pay.jpg'),
  ];
}