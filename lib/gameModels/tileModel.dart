class TileModel {
  String imagePath;
  bool isSelected;

  TileModel({this.imagePath, this.isSelected});

  void setImagePath(String getImagePath) {
    imagePath = getImagePath;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  String getImagePath() {
    return imagePath;
  }

  bool getIsSelected() {
    return isSelected;
  }
}
