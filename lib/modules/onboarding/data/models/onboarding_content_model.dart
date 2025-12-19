import 'package:befit_code_testing/modules/onboarding/data/models/onboarding_content_model_type.dart';

import 'contents/onboarding_header_content_model.dart';

abstract class OnboardingContentModel {
  OnboardingContentModelType get type;

  factory OnboardingContentModel.fromJson(Map<String, dynamic> json) {
    return switch (OnboardingContentModelType.fromKey(json['type'] ?? '')) {
      OnboardingContentModelType.headerContent => OnboardingHeaderContentModel.fromJson(json['data']),
    };
  }
}
