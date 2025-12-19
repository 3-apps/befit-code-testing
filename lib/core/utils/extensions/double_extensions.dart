extension DoubleHeightExtensions on double {
  double get cmToIn => this / 2.54;
  double get inToCm => this * 2.54;

  double get kgToLb => this * 2.205;
  double get lbToKg => this / 2.205;
}
