class Images {
  Images._();

  static const One = 'assets/images/one.jpg';
  static const Two = 'assets/images/two.jpg';
  static const Three = 'assets/images/three.jpg';
  static const Four = 'assets/images/four.jpg';
  static const Five = 'assets/images/five.jpg';
  static const Six = 'assets/images/six.jpg';
  static const Seven = 'assets/images/seven.jpg';

  static String getImageById(int id) {
    switch (id) {
      case 1:
        return One;
      case 2:
        return Two;
      case 3:
        return Three;
      case 4:
        return Four;
      case 5:
        return Five;
      case 6:
        return Six;
      case 7:
        return Seven;
      default:
        return One;
    }
  }
}
