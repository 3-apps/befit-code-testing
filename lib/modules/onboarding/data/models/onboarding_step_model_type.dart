enum OnboardingStepModelType {
  welcomeScreen("welcome-screen"),
  gender("gender"),
  currentExperience("current-experience"),
  gymGoal("gymGoal"),
  trainingFrequency("training-frequency"),
  age("age"),
  height("height"),
  currentWeight("current-weight");

  final String key;
  const OnboardingStepModelType(this.key);

  factory OnboardingStepModelType.fromKey(String key) {
    return values.firstWhere((e) => e.key == key, orElse: () => welcomeScreen);
  }
}
