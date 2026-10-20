class ProdukModel {
  String namaProduk;
  String harga;
  String descrtipsi;
  String ImageProduk;
  String reviews;//assets/image url
  String rating;
  String tahunPembuatan;



  ProdukModel(
    {
      required this.namaProduk, 
      required this.harga,
      required this.descrtipsi,
      required this.ImageProduk,
      required this.reviews,
      required this.rating,
      required this.tahunPembuatan,
    }
  );
}