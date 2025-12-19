enum OnboardingContentModelType {
  headerContent("header_content");

  final String key;
  const OnboardingContentModelType(this.key);

  factory OnboardingContentModelType.fromKey(String key) {
    return values.firstWhere((e) => e.key == key, orElse: () => headerContent);
  }
}
