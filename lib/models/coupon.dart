enum CouponTypes {
  fixed,
  percentage,
  free,
}

class Coupon {
  String merchantName;
  String merchantToken;
  String couponCode;
  CouponTypes type;
  double amount; // In percent or dollars, depending on coupon type
  String description;
  DateTime expiration;

  Coupon(
    this.merchantName,
    this.merchantToken,
    this.couponCode,
    this.type,
    this.amount,
    this.description,
    this.expiration,
  );
}