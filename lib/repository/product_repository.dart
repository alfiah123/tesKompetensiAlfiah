import '../model/modelProducts.dart';

class ProductRepository {
  static List<Product> products = [
    Product(
      productName: 'Nasi Goreng',
      description: 'Nasi goreng dengan bumbu rempah khas Indonesia.',
      price: 15000,
      imageUrl:
          'https://asset.kompas.com/crops/MrdYDsxogO0J3wGkWCaGLn2RHVc=/84x60:882x592/750x500/data/photo/2021/11/17/61949959e07d3.jpg',
      jenisMakanan: 'Makanan',
    ),
    Product(
      productName: 'Es Teh Manis',
      description: 'Es teh manis dengan tambahan es serut.',
      price: 5000,
      imageUrl:
          'https://nilaigizi.com/assets/images/produk/produk_1578041377.jpg',
      jenisMakanan: 'Minuman',
    ),
    Product(
      productName: 'Mie Goreng',
      description: 'Mie Goreng Kuning.',
      price: 17000,
      imageUrl:
          'https://cdn0-production-images-kly.akamaized.net/DNppc1O3RQTpv22_VvxHmqk5bOk=/680x383/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3129172/original/099632200_1589527804-shutterstock_1455941861.jpg',
      jenisMakanan: 'Makanan',
    ),
  ];
}
