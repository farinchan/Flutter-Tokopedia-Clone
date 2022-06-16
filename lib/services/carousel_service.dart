import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tokped/models/carousel.dart';

class CarouselService {
  String baseUrl = 'url';

  Future<List<Carousel>> getProduct() async {
    var url = Uri.parse('$baseUrl/carousel');

    var response = await http.get(url);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<Carousel> carousel = [];
      for (var item in data) {
        carousel.add(
          Carousel.fromJson(
            item,
          ),
        );
      }
      return carousel;
    } else {
      throw Exception('Gagal get carousel!');
    }
  }
}
