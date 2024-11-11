class SliderModel {
  String? image;
  String? text;
  String? altText;
  String? bAltText;
  String? productImage;
  int? kBackgroundColor;

  SliderModel(
    this.image,
    this.text,
    this.altText,
    this.bAltText,
    this.productImage,
    this.kBackgroundColor,
  );

  SliderModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    kBackgroundColor = json['kBackgroundColor'];
    text = json['text'];
    altText = json['altText'];
    bAltText = json['bAltText'];
    productImage = json['productImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['kBackgroundColor'] = kBackgroundColor;
    data['text'] = text;
    data['altText'] = altText;
    data['bAltText'] = bAltText;
    data['productImage'] = productImage;
    return data;
  }
}

List<SliderModel> slides =
    slideData.map((item) => SliderModel.fromJson(item)).toList();

var slideData = [
  {
    "image": "assets/slides/background-1.jpeg",
    "kBackgroundColor": 0xFF2c614f,
    "text": "Welcome to the Promote Uganda Dashboard!",
    "altText": "You can access & track your services in real-time.",
    "bAltText": "Manage Content, subscriptions and users with ease!",
    "productImage": "assets/images/mockup.png"
  },
  {
    "image": "assets/slides/background-2.jpeg",
    "kBackgroundColor": 0xFF8a1a4c,
    "text": "¡Bienvenido al tablero Promote Uganda Dashboard!",
    "altText": "You can access & track your services in real-time.",
    "bAltText": "Manage Content, subscriptions and users with ease!",
    "productImage": "assets/images/mockup-2.png"
  },
  {
    "image": "assets/slides/background-3.jpeg",
    "kBackgroundColor": 0xFF0ab3ec,
    "text": "Willkommen im Promote Uganda Dashboard!",
    "altText": "You can access & track your services in real-time.",
    "bAltText": "Manage Content, subscriptions and users with ease!",
    "productImage": "assets/images/mockup-3.png"
  }
];
