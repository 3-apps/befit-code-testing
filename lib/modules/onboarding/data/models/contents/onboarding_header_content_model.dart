import 'package:befit_code_testing/modules/onboarding/data/models/onboarding_content_model_type.dart';

import '../onboarding_content_model.dart';

class OnboardingHeaderContentModel implements OnboardingContentModel {
  @override
  OnboardingContentModelType get type =>
      OnboardingContentModelType.headerContent;

  final String title;
  final String? subtitle;
  OnboardingHeaderContentModel({required this.title, this.subtitle});

  factory OnboardingHeaderContentModel.fromJson(Map<String, dynamic> json) {
    return OnboardingHeaderContentModel(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String?,
    );
  }
}
