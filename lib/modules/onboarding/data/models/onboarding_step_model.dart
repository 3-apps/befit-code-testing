import 'package:befit_code_testing/modules/onboarding/data/models/onboarding_content_model.dart';
import 'package:befit_code_testing/modules/onboarding/data/models/onboarding_step_model_type.dart';

class OnboardingStepModel {
  final OnboardingStepModelType id;
  final String ctaEvent;
  final OnboardingContentModel? content;

  OnboardingStepModel({
    required this.id,
    required this.ctaEvent,
    required this.content,
  });

  factory OnboardingStepModel.fromJson(Map<String, dynamic> json) {
    return OnboardingStepModel(
      id: OnboardingStepModelType.fromKey(json['id'] ?? ''),
      ctaEvent: json['cta_event'] ?? '',
      content: json['content'] != null
          ? OnboardingContentModel.fromJson(json['content'])
          : null,
    );
  }
}
