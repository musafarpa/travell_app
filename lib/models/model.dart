class imagemodel {
final String images;
final String texts;
imagemodel({
  required this.images,
  required this.texts,
});
factory imagemodel.fromJson(Map<String, dynamic> json) {
  return imagemodel(
    texts: json['texts'] ?? '',
    images: json['images'] ?? '',
  );
}

Map<String, dynamic> toJson() {
  return {
    'texts': texts,
    'images': images,
  };
}
}
class textmodel {
  final String texts;
  textmodel({
    required this.texts,
  });
}


class chirstmodel {
  final String text1;
  final String text2;
  final String text3;
  chirstmodel({
    required this.text1,
    required this.text2,
    required this.text3,
  });
}
class imagesmodel {
  final String image1;
  final String text1;
  imagesmodel({
    required this.image1,
    required this.text1,
  });
}
class beachmodel {
  final String images;
  final String texts;
  final double rating;

  beachmodel({
    required this.images,
    required this.texts,
    required this.rating,

  });

  factory beachmodel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('images') && json.containsKey('texts') && json.containsKey('rating')) {
      return beachmodel(
        images: json['images'] as String,
        texts: json['texts'] as String, rating: json['rating'],
      );
    } else {
      throw FormatException("Invalid JSON format for beachmodel");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'texts': texts,
    };
  }
}

class lakemodel{
  final String images;
  final String texts;
  lakemodel({
    required this.images,
    required this.texts,
});
  factory lakemodel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('images') && json.containsKey('texts')) {
      return lakemodel(
        images: json['images'] as String,
        texts: json['texts'] as String,
      );
    } else {
      throw FormatException("Invalid JSON format for beachmodel");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'texts': texts,
    };
  }

}



class mounmodel{
  final String images;
  final String texts;
  mounmodel({
    required this.images,
    required this.texts
});

  factory mounmodel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('images') && json.containsKey('texts')) {
      return mounmodel(
        images: json['images'] as String,
        texts: json['texts'] as String,
      );
    } else {
      throw FormatException("Invalid JSON format for beachmodel");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'texts': texts,
    };
  }
}
class rivermodel{
  final String images;
  final String texts;
  rivermodel({
    required this.images,
    required this.texts,
});

  factory rivermodel.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('images') && json.containsKey('texts')) {
      return rivermodel(
        images: json['images'] as String,
        texts: json['texts'] as String,
      );
    } else {
      throw FormatException("Invalid JSON format for beachmodel");
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'texts': texts,
    };
  }
}
class whishlistitem{
  final chirstmodel product;
  final imagesmodel item;

  whishlistitem ({required this.product, required this.item
  });
}
class roommodel {
  String images;
  String texts;
  String texts1;

  roommodel({required this.images, required this.texts, required this.texts1});

  Map<String, dynamic> toJson() {
    return {
      'images': images,
      'texts': texts,
      'texts1': texts1,
    };
  }

  factory roommodel.fromJson(Map<String, dynamic> json) {
    return roommodel(
      images: json['images'],
      texts: json['texts'],
      texts1: json['texts1'],
    );
  }
}

class CartItem {
  final String name;
  final String image;
  final String description;

  CartItem(this.name, this.image, this.description);
}
