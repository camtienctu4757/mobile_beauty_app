class Shop {
  const Shop(
      {required this.id,
      required this.shopName,
      required this.idOwner,
      required this.location,
      required this.totalEmloyees,
      required this.shopImg});
  final int id;
  final String shopName;
  final String location;
  final int idOwner;
  final int totalEmloyees;
  final String shopImg;
}
