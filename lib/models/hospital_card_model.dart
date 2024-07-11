class HospitalModel {
  final String name;
  final String imageUrl;
  final String address;
  final int? numOfIncubations;
  final int? codeOfIncubations;
  final int? price;

  const HospitalModel({
    required this.name,
    required this.imageUrl,
    required this.address,
    this.numOfIncubations,
    this.codeOfIncubations,
    this.price,
  });
}
