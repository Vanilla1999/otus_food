class Images {
  Images._();

  static const one = 'assets/images/one.jpg';
  static const two = 'assets/images/two.jpg';
  static const three = 'assets/images/three.jpg';
  static const four = 'assets/images/four.jpg';
  static const five = 'assets/images/five.jpg';
  static const six = 'assets/images/six.jpg';
  static const seven = 'assets/images/seven.jpg';
  static const listImages = [one, two, three, four, five, six, seven];

  static const megaphone = 'assets/images/megaphone.png';

  static String getImageById(int id) {
    return listImages[id];
  }
}
